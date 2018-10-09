#!/bin/bash
set -e
zypper --gpg-auto-import-keys ref
zypper --non-interactive install geekodoc git daps docbook5-xsl-stylesheets jing docbook_5 aspell trang aspell-en tar novdoc
zypper --non-interactive clean --all # todo take a look at our testing containers - they do 1 extra step for the cleanup