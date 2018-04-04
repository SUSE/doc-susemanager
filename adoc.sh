#!/bin/sh
export FILE=$1 #xml/MAIN-manager.xml
export NAME=`basename $FILE .xml`
echo "Converting $NAME"
rm -rf asciidoctor
docbookrx --strict xml/$NAME.xml
mv xml/*adoc adoc
#asciidoctor -b html -d book -D asciidoctor/html xml/$NAME.adoc
asciidoctor -b docbook5 -d book -D asciidoctor/xml adoc/$NAME.adoc
daps -m asciidoctor/xml/$NAME.xml --styleroot /usr/share/xml/docbook/stylesheet/suse2013-ns html
cp images/src/png/*.png images/src/svg/*.svg asciidoctor/build/$NAME/html/$NAME/images
