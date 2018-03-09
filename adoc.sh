#!/bin/sh
export FILE=$1
export NAME=`basename $1 .xml`
echo "Converting $NAME"
rm -rf asciidoctor
docbookrx --strict xml/$NAME.xml
#asciidoctor -b html -d book -D asciidoctor/html xml/$NAME.adoc
asciidoctor -b docbook5 -d book -D asciidoctor/xml xml/$NAME.adoc
daps -m asciidoctor/xml/$NAME.xml --styleroot /usr/share/xml/docbook/stylesheet/suse2013-ns html
cp images/src/png/*.png images/src/svg/*.svg asciidoctor/build/MAIN-manager/html/MAIN-manager/images
