#!/bin/bash

# Perform templating of wikiconfig
sed -e "s/\${WIKI_NAME}/$WIKI_NAME/" /usr/local/share/moin/wikiconfig.py > /usr/local/share/moin/wikiconfig.py.tmp
mv /usr/local/share/moin/wikiconfig.py.tmp /usr/local/share/moin/wikiconfig.py
