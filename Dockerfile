# VERSION 0.2
# AUTHOR:	  Michael Hammer <mail@michael-hammer.at>
#		  James Wilmot <jameswilmot2000@gmail.com>
# DESCRIPTION:    Image with MoinMoin wiki, uwsgi, nginx, self signed SSL and memodump theme
# TO_BUILD:       docker build -t moinmoin .
# TO_RUN:         docker run -it -p $HOST_HTTP_PORT:80 -p HOST_HTTPS_PORT:443 --name "my_wiki" moinmoin

FROM ubuntu:xenial
MAINTAINER Michael Hammer <mail@michael-hammer.at>

# Set the version you want of MoinMoin
ENV MM_VERSION 1.9.9

ENV WIKI_ADMIN mueli
ENV WIKI_NAME mortar.derhammer.net
ENV SSL_KEY mortar.derhammer.net.key
ENV SSL_CRT mortar.derhammer.net.crt
ENV MM_CSUM 4397d7760b7ae324d7914ffeb1a9eeb15e09933b61468072acd3c3870351efa4

# Update
RUN apt-get update -qq && apt-get -qqy upgrade

# Install software
RUN apt-get -qqy install python wget nginx uwsgi uwsgi-plugin-python rsyslog python-ldap apache2-utils sed
RUN apt-get clean

# add init script
ADD init_script.sh /usr/local/bin/

# Download MoinMoin
RUN wget http://static.moinmo.in/files/moin-$MM_VERSION.tar.gz
RUN if [ "$MM_CSUM" != "$(sha256sum moin-$MM_VERSION.tar.gz | awk '{print($1)}')" ]; then exit 1; fi;
RUN mkdir moinmoin
RUN tar xf moin-$MM_VERSION.tar.gz -C moinmoin --strip-components=1
RUN rm moin-$MM_VERSION.tar.gz

# Install MoinMoin
RUN cd moinmoin && python setup.py install --force --prefix=/usr/local
Add configs/wikiconfig.py /usr/local/share/moin/

# ADD logo.png /usr/local/lib/python2.7/dist-packages/MoinMoin/web/static/htdocs/common/

# Install moinmoin-memodump theme
ADD memodump.py /usr/local/share/moin/data/plugin/theme/ 
ADD memodump/ /usr/local/lib/python2.7/dist-packages/MoinMoin/web/static/htdocs/memodump
RUN chown -R www-data:www-data /usr/local/share/moin/data

# Configure nginx
ADD configs/nginx.conf /etc/nginx/
ADD configs/moinmoin.conf /etc/nginx/sites-available/
RUN mkdir -p /var/cache/nginx/cache
RUN ln -s /etc/nginx/sites-available/moinmoin.conf /etc/nginx/sites-enabled/moinmoin.conf
RUN rm /etc/nginx/sites-enabled/default

# Create self signed certificate
# ADD generate_ssl_key.sh /usr/local/bin/
# RUN /usr/local/bin/generate_ssl_key.sh moinmoin.example.org
# RUN mv cert.pem /etc/ssl/certs/
# RUN mv key.pem /etc/ssl/private/

ADD ssl/$SSL_KEY /etc/ssl/private/
ADD ssl/$SSL_CRT /etc/ssl/certs/

VOLUME /usr/local/share/moin/data
VOLUME /usr/local/share/moin/underlay

EXPOSE 443

CMD bash -C '/usr/local/bin/init_script.sh'; \
  service rsyslog start && service nginx start && \
  uwsgi --uid www-data \
    -s /tmp/uwsgi.sock \
    --plugins python \
    --pidfile /var/run/uwsgi-moinmoin.pid \
    --wsgi-file server/moin.wsgi \
    -M -p 4 \
    --chdir /usr/local/share/moin \
    --python-path /usr/local/share/moin \
    --harakiri 30 \
    --die-on-term
