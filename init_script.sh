#!/bin/bash

# Perform templating of wikiconfig
sed  -e "s/\${WIKI_NAME}/$WIKI_NAME/" \
     -e "s/\${WIKI_ADMIN}/$WIKI_NAME/" \
     -e "s/\${WIKI_FRONTPAGE}/$WIKI_FRONTPAGE/" \
     -e "s/\${WIKI_THEME}/$WIKI_THEME/" \
     /usr/local/share/moin/wikiconfig.py > /usr/local/share/moin/wikiconfig.py.tmp
mv /usr/local/share/moin/wikiconfig.py.tmp /usr/local/share/moin/wikiconfig.py
