docker-moinmoin-personalwiki
============================

Docker image for a simple MoinMoin wiki with memodump default theme.

Based on [dossist/moinmoin-wiki][moinmoin-wiki].

Screenshot
----------

![Main](https://github.com/JamesWilmot/docker-moinmoin-httpauth-memodump/blob/master/screenshot.png)


Quickstart
----------

```console
docker run -it -p 443:443 -p 80:80 --name "personal_wiki" -e WIKI_NAME="My personal wiki" jameswilmot/moinmoin-personalwiki
```

Build 
-----

```console
git@github.com:JamesWilmot/docker-moinmoin-personalwiki.git
cd docker-moinmoin-personalwiki
docker build -t moinmoin-personalwiki .
docker run -it -p 443:443 -p 80:80 --name "personal_wiki" -e WIKI_NAME="My personal wiki" moinmoin-personalwiki
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
