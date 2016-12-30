#!/bin/bash

# Perform templating of wikiconfig
sed -i.bak -e "s/\${WIKI_NAME}/$WIKI_NAME/" \
     -e "s/\${WIKI_ADMIN}/$WIKI_NAME/" \
     -e "s/\${WIKI_FRONTPAGE}/$WIKI_FRONTPAGE/" \
     -e "s/\${WIKI_THEME}/$WIKI_THEME/" \
     /usr/local/share/moin/wikiconfig.py

# Perform templating of moinmoin.conf
sed -i.bak -e "s/\${SSL_KEY}/$SSL_KEY/" \
     -e "s/\${SSL_CRT}/$SSL_CRT/" \
     /etc/nginx/sites-available/moinmoin.conf
