#!/bin/sh
export FILE=$1
export NAME=`basename $1 .xml`
echo "Converting $NAME"
rm -rf asciidoctor
docbookrx xml/$NAME.xml 2>out.err
asciidoctor -b docbook5 -d book -D asciidoctor/xml xml/$NAME.adoc
daps -m asciidoctor/xml/$NAME.xml --styleroot /usr/share/xml/docbook/stylesheet/suse2013-ns html
#docbookrx xml/book_mgr_getting_started.xml
#asciidoctor -b html -d book -D asciidoctor/xml xml/book_mgr_getting_started.adoc
cp images/src/png/*.png asciidoctor/xml
#daps -m asciidoctor/xml/book_mgr_getting_started.xml --styleroot /usr/share/xml/docbook/stylesheet/suse2013-ns html
#docbookrx xml/book_mgr_best_practices.xml
#docbookrx xml/book_suma_reference_manual.xml
#docbookrx xml/book_suma_advanced_topics.xml
#asciidoctor -b docbook5 -d book -D asciidoctor/xml xml/MAIN-manager.adoc
#daps -m asciidoctor/xml/MAIN-manager.xml --styleroot /usr/share/xml/docbook/stylesheet/suse2013-ns html
#asciidoctor -b html -d book -D asciidoctor/xml xml/MAIN-manager.adoc
#cp images/src/png/*.png asciidoctor/xml
