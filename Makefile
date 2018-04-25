
all: html pdf

xml: xml/MAIN-manager.xml

xml/MAIN-manager.xml: adoc/*.adoc
	asciidoctor -b docbook5 -d book -D xxml adoc/MAIN-manager.adoc
	# insert ENTITY
	sed -i '2i <!DOCTYPE set [ <!ENTITY % entities SYSTEM "entity-decl.ent"> %entities; ]>' xxml/MAIN-manager.xml
	# replace {foo} (but not ${foo}) with &foo;
	perl -p -i -e 's/([^\$$])\{(\w+)\}/\1\&$$2\;/g' xxml/MAIN-manager.xml
	# make .ent files available
	(cd xxml; ln -s ../entities/*ent .)
	mv xxml xml

#daps -m xml/$NAME.xml --verbosity=0 --styleroot /usr/share/xml/docbook/stylesheet/suse2013-ns html
#rm -rf build/$NAME/html/$NAME/images
#ln -sf ../../../../adoc/images build/$NAME/html/$NAME

html: xml
	daps -d DC-create-all html
	(cd build/create-all/html/create-all; rm -rf images; ln -sf ../../../../adoc/images .)

pdf: xml
	daps -d DC-create-all pdf

advanced:
	daps -d DC-susemanager-advanced-topics pdf

best-practices:
	daps -d DC-susemanager-best-practices pdf

getting-started:
	daps -d DC-susemanager-getting-started pdf

reference:
	daps -d DC-susemanager-reference pdf

quick: quick-html quick-pdf

quick-html:
	daps -d DC-susemanager-quick html

quick-pdf:
	daps -d DC-susemanager-quick pdf

# Target for www.suse.com/documentation
online-docs:
	daps -vvv -d DC-create-all --force online-docs

dist: xml
	mkdir -p images/src
	(mkdir -p images/src/png; cd images/src/png; ln -sf ../../../adoc/images/*.png .)
	(mkdir -p images/src/svg; cd images/src/svg; ln -sf ../../../adoc/images/*.svg .)
	daps -d DC-create-all-adoc package-src --set-date=$(date --iso) --def-file DEF-susemanager-docs-adoc

package: package/doc-susemanager-develop.tar.bz2
#add origin in front of develop to build for jenkins
package/doc-susemanager-develop.tar.bz2:
	git archive --format=tar --prefix=doc-susemanager-develop/ origin/develop > package/doc-susemanager-develop.tar 
	bzip2 package/doc-susemanager-develop.tar
clean:
	rm -rf package/doc-susemanager-develop.tar.bz2
	rm -rf package/*~
	rm -rf images
	rm -rf xml
	rm -rf xxml
	rm -rf build
