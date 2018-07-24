
PRODUCTNAME=

uyuni:
	$(eval PRODUCTNAME = Uyuni)

suma:
	$(eval PRODUCTNAME = SUSE Manager)

xml-suma: xml/MAIN-manager.xml suma-images

xml-uyuni: xml/MAIN-manager.xml uyuni-images

suma-images: adoc/images/suma/*
	@ccecho result "Linking suma images to DAPS expected image directories..."
	mkdir -p images/src
	(mkdir -p images/src/png; cd images/src/png; ln -sf ../../../adoc/images/suma/*.png .)
	(mkdir -p images/src/svg; cd images/src/svg; ln -sf ../../../adoc/images/suma/*.svg .)

uyuni-images: adoc/images/uyuni/*
	@ccecho result "Linking Uyuni images to DAPS expected image directories..."
	sleep 1
	mkdir -p images/src
	(mkdir -p images/src/png; cd images/src/png; ln -sf ../../../adoc/images/uyuni/*.png .)
	(mkdir -p images/src/svg; cd images/src/svg; ln -sf ../../../adoc/images/uyuni/*.svg .)

# SUSE Manager asciidoctor processing instructions and entity linking
xml/MAIN-manager.xml: adoc/*.adoc
	@ccecho result "Converting adoc MAIN-manager.xml to Docbook5 xml and adding the {PRODUCTNAME} entities..."
	asciidoctor -a productname='$(PRODUCTNAME)' -b docbook5 -d book -D xxml adoc/MAIN-manager.adoc
	#@ccecho result "Inserting entities from doc-susemanager/entities..."
	#sed -i '2i <!DOCTYPE set [ <!ENTITY % entities SYSTEM "entity-decl.ent"> %entities; ]>' xxml/MAIN-manager.xml
	#@ccecho result "Replacing {foo} (but not \${foo}) with &foo;..."
	#perl -p -i -e 's/([^\$$])\{(\w+)\}/\1\&$$2\;/g' xxml/MAIN-manager.xml
	#@ccecho result "Making .ent files available for validation..."
	#(cd xxml; ln -sf ../entities/*ent .)
	rm -rf xml
	mv xxml xml

# run book-to-set stylesheet on xml/MAIN-manager.xml this allows creation of single books
book-to-set: clean suma-dist
	@ccecho result "Copying Main file into book-to-set/ ..."
	cp xml/MAIN-manager.xml book-to-set/MAIN-manager.xml
	@ccecho result "Making entities available ..."
	(cd book-to-set; ln -sf ../entities/*ent .)
	@ccecho result "Converting unsupported db5 tags to supported geekodoc subset tags..."
	cd book-to-set/; xsltproc book2set.xsl MAIN-manager.xml > test.xml
	@ccecho result "Renaming and moving test.xml to xml/MAIN-manager.xml ..."
	mv book-to-set/test.xml book-to-set/xml/MAIN-manager.xml
	@ccecho result "Validating resulting Main file ..."
	cd book-to-set/; daps -m xml/MAIN-manager.xml validate
	@ccecho result "Copying processed Main file to primary build path ..."
	cp book-to-set/xml/MAIN-manager.xml xml/MAIN-manager.xml

# TODO: Add additional DC files for uyuni so we can setup a make all scenario for building both SUMA/Uyuni docs and pdf files.
# Build Uyuni docs and link images to the uyuni folder
uyuni-html: uyuni xml-uyuni
	daps -d DC-create-all-uyuni html
	(cd build/create-all/html/create-all; rm -rf images; ln -sf ../../../../adoc/images/uyuni .)

# Build SUMA docs and link images to the suma folder
suma-html: suma xml-suma
	daps -d DC-create-all html
	(cd build/create-all/html/create-all; rm -rf images; ln -sf ../../../../adoc/images/suma/ .)

# Make SUMA Packages for OBS
suma-dist: xml-suma
	daps -vvv -d DC-create-all package-src --set-date=$(date --iso) --def-file DEF-susemanager-docs-adoc; time

# Make Uyuni Packages for OBS
uyuni-dist: xml-uyuni
	daps -vvv -d DC-create-all-uyuni package-src --set-date=$(date --iso) --def-file DEF-susemanager-docs-adoc; time

#### Build SUMA PDF ####
suma-pdf: xml-suma
	daps -d DC-create-all pdf; time

suma-advanced-pdf: xml-suma
	daps -d DC-susemanager-advanced-topics pdf; time

suma-best-practices-pdf: xml-suma
	daps -d DC-susemanager-best-practices pdf; time

suma-getting-started-pdf:
	daps -d DC-susemanager-getting-started pdf; time

suma-reference-pdf:
	daps -d DC-susemanager-reference pdf; time

#### Build SUMA HTML ####
#suma-html: xml-suma
#	daps -d DC-create-all html; time

suma-advanced-html: xml-suma
	daps -d DC-susemanager-advanced-topics html; time

suma-best-practices-html: xml-suma
	daps -d DC-susemanager-best-practices html; time

suma-getting-started-html:
	daps -d DC-susemanager-getting-started html; time

suma-reference-html:
	daps -d DC-susemanager-reference html; time

#### Build Uyuni PDF ####
uyuni-pdf: xml
	daps -d DC-create-all-uyuni pdf; time

uyuni-advanced-pdf:
	daps -d DC-uyuni-advanced-topics- pdf; time

uyuni-best-practices-pdf:
	daps -d DC-uyuni-best-practices pdf; time

uyuni-getting-started-pdf:
	daps -d DC-uyuni-getting-started pdf; time

uyuni-reference-pdf:
	daps -d DC-uyuni-reference pdf; time

# Target for www.suse.com/documentation
suma-online-docs:
	daps -d DC-create-all online-docs; time

uyuni-online-docs:
	daps -d DC-create-all-uyuni --force online-docs; time

clean:
	rm -rf package/doc-susemanager-develop.tar.bz2
	rm -rf package/*~
	rm -rf images
	rm -rf xml
	rm -rf xxml
	rm -rf build
