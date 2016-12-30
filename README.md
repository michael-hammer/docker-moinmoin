docker-moinmoin-personalwiki
============================

Docker image for a simple MoinMoin wiki with memodump default theme.

Based on [JamesWilmot/docker-moinmoin-personalwiki][moinmoin-wiki] (which was forked from [dossist/moinmoin-wiki][moinmoin-wiki]).


Quickstart
----------

```console
docker run -it -p 443:443 -p 80:80 --name "personal_wiki" -e WIKI_NAME="My personal wiki" jameswilmot/moinmoin-personalwiki
```

Build 
-----

```console
git@github.com:michael-hammer/docker-moinmoin
cd docker-moinmoin
docker build -t moinmoin .
docker run -it -p $HOST_HTTPS_PORT:443 -p $HOST_HTTP_PORT:80 --name "personal_wiki" -e WIKI_NAME="My personal wiki" moinmoin-personalwiki
```

Configuration
-------------


License and copyrights
----------------------

This docker image is licensed under [GNU GPL][].  

[moinmoin-memodump][] is copyrighted by [dossist][] and licenced under [GNU GPL][].
[MoinMoin][] is copyrighted by [The MoinMoin development team](https://moinmo.in/MoinCoreTeamGroup) and licensed under [GNU GPL][].  

[moinmoin-memodump]: https://github.com/dossist/moinmoin-memodump
[moinmoin-wiki]: https://github.com/olavgg/moinmoin-wiki
[GNU GPL]: http://www.gnu.org/licenses/gpl
[MIT]: https://github.com/twbs/bootstrap/blob/master/LICENSE
[MoinMoin]: https://moinmo.in/
[Twitter Bootstrap]: http://getbootstrap.com/
[dossist]: https://github.com/dossist/ 
