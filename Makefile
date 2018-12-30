
PRODUCTNAME=

uyuni:
	$(eval PRODUCTNAME = Uyuni)

suma:
	$(eval PRODUCTNAME = SUSE Manager)

xml-suma: xml/MAIN-manager.xml suma-images

xml-uyuni: xml/MAIN-manager.xml uyuni-images

suma-images: adoc/images/suma/*
	mkdir -p images/src
	(mkdir -p images/src/png; cd images/src/png; ln -sf ../../../adoc/images/suma/*.png .)
	(mkdir -p images/src/svg; cd images/src/svg; ln -sf ../../../adoc/images/suma/*.svg .)

uyuni-images: adoc/images/uyuni/*
	mkdir -p images/src
	(mkdir -p images/src/png; cd images/src/png; ln -sf ../../../adoc/images/uyuni/*.png .)
	(mkdir -p images/src/svg; cd images/src/svg; ln -sf ../../../adoc/images/uyuni/*.svg .)

#### Uyuni asciidoctor processing instructions and entity linking
xml/MAIN-manager.xml: adoc/*.adoc
	rm -rf xml/MAIN-manager.xml 
	asciidoctor -a productname='$(PRODUCTNAME)' -b docbook5 -d book -D xxml adoc/MAIN-manager.adoc
	rm -rf xml
	mv xxml xml


#### run book-to-set stylesheet first on xml/MAIN-manager.xml this allows creation of single books, next run make suma-getting-started-html to created both the single and chunked version of a book
book-to-set: suma xml-suma
	#rm -rf xml/MAIN-manager.xml
	cp xml/MAIN-manager.xml book-to-set/MAIN-manager.xml
	(cd book-to-set; ln -sf ../entities/*ent .)
	(cd book-to-set/; xsltproc book2set.xsl MAIN-manager.xml > test.xml)
	mkdir -p book-to-set/xml
	mv book-to-set/test.xml book-to-set/xml/MAIN-manager.xml
	cd book-to-set/; daps -m xml/MAIN-manager.xml validate
	cp book-to-set/xml/MAIN-manager.xml xml/MAIN-manager.xml

#### Build Uyuni docs and link images to the uyuni folder
book-to-set-uyuni: uyuni xml-uyuni
	rm -rf xml/MAIN-manager.xml
	cp xml/MAIN-manager.xml book-to-set/MAIN-manager.xml
	(cd book-to-set; ln -sf ../entities/*ent .)
	(cd book-to-set/; xsltproc book2set.xsl MAIN-manager.xml > test.xml)
	mkdir -p book-to-set/xml
	mv book-to-set/test.xml book-to-set/xml/MAIN-manager.xml
	cd book-to-set/; daps -m xml/MAIN-manager.xml validate
	cp book-to-set/xml/MAIN-manager.xml xml/MAIN-manager.xml

#### Uyuni Documentation Outputs
#### Create all Uyuni docs (HTML)
uyuni-html: uyuni xml-uyuni
	daps -d DC-create-all-uyuni html
	(cd build/create-all/html/create-all; rm -rf images; ln -sf ../../../../adoc/images/uyuni .)

#### Make Uyuni Packages for OBS
uyuni-dist: uyuni xml-uyuni
	daps -vvv -d DC-create-all-uyuni package-src --set-date=$(date --iso) --def-file DEF-susemanager-docs-adoc

#### Build Uyuni .pdf files
uyuni-pdf: uyuni xml-uyuni 
	daps -d DC-create-all-uyuni pdf

uyuni-advanced-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-advanced-topics pdf

uyuni-best-practices-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-best-practices pdf

uyuni-getting-started-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-getting-started pdf

uyuni-reference-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-reference pdf

#### Build UYUNI HTML Chunked/single
uyuni-advanced-html: uyuni xml-uyuni
	daps -d DC-uyuni-advanced-topics html
	daps -d DC-uyuni-advanced-topics html --single

uyuni-best-practices-html: uyuni xml-uyuni
	daps -d DC-uyuni-best-practices html
	daps -d DC-uyuni-best-practices html --single

uyuni-getting-started-html: uyuni xml-uyuni
	daps -d DC-uyuni-getting-started html
	daps -d DC-uyuni-getting-started html --single

uyuni-reference-html: uyuni xml-uyuni
	daps -d DC-uyuni-reference html
	daps -d DC-uyuni-reference html --single

#### Build SUMA docs and link images to the suma folder
suma-html: suma xml-suma
	daps -d DC-create-all html
	(cd build/create-all/html/create-all; ln -sf ../../../../../adoc/images/suma .)

#### Make SUMA Packages for OBS
suma-dist: suma xml-suma
	daps -vvv -d DC-create-all package-src --set-date=$(date --iso) --def-file DEF-susemanager-docs-adoc

#### Build SUMA PDF
suma-pdf: suma xml-suma
	daps -d DC-create-all pdf

suma-advanced-pdf: suma xml-suma
	daps -d DC-susemanager-advanced-topics pdf

suma-best-practices-pdf: suma xml-suma
	daps -d DC-susemanager-best-practices pdf

suma-getting-started-pdf: suma xml-suma
	daps -d DC-susemanager-getting-started pdf

suma-reference-pdf: suma xml-suma
	daps -d DC-susemanager-reference pdf

#### Build SUMA HTML Chunked/single

suma-advanced-html: suma xml-suma
	daps -d DC-susemanager-advanced-topics html
	daps -d DC-susemanager-advanced-topics html --single

suma-best-practices-html: suma xml-suma
	daps -d DC-susemanager-best-practices html
	daps -d DC-susemanager-best-practices html --single

suma-getting-started-html: suma xml-suma
	daps -d DC-susemanager-getting-started html
	daps -d DC-susemanager-getting-started html --single

suma-reference-html: suma xml-suma
	daps -d DC-susemanager-reference html
	daps -d DC-susemanager-reference html --single

#### Retail
xml-retail: xml/book_retail_getting_started.xml retail-images

retail-images: adoc/images/retail/*
	mkdir -p images/src
	(mkdir -p images/src/png; cd images/src/png; ln -sf ../../../adoc/images/retail/*.png .)
	(mkdir -p images/src/svg; cd images/src/svg; ln -sf ../../../adoc/images/retail/*.svg .)

xml/book_retail_getting_started.xml: adoc/retail*.adoc
	asciidoctor -a productname='$(PRODUCTNAME)' -b docbook5 -d book -D xxml adoc/book_retail_getting_started.adoc
	rm -rf xml
	mv xxml xml

retail-getting-started-html: suma xml-retail
	daps -d DC-retail-getting-started html

retail-getting-started-pdf: suma xml-retail
	daps -d DC-retail-getting-started pdf

xml-retail-migration: xml/book_retail-migration.xml retail-images

xml/book_retail-migration.xml: adoc/retail_migr*.adoc
	asciidoctor -a productname='$(PRODUCTNAME)' -b docbook5 -d book -D xxml adoc/book_retail_migration.adoc
	rm -rf xml
	mv xxml xml

retail-migration-html: suma xml-retail-migration
	daps -d DC-retail-migration html

retail-migration-pdf: suma xml-retail-migration
	daps -d DC-retail-migration pdf


#### Cleanup
clean:
	rm -rf package/doc-susemanager-develop.tar.bz2
	rm -rf package/*~
	rm -rf images
	rm -rf xml
	rm -rf xxml
	rm -rf build
	rm -rf book-to-set/build/
	rm -rf book-to-set/xml/*


# Keep for reference
	#@ccecho result "Inserting entities from doc-susemanager/entities..."
	#sed -i '2i <!DOCTYPE set [ <!ENTITY % entities SYSTEM "entity-decl.ent"> %entities; ]>' xxml/MAIN-manager.xml
	#@ccecho result "Replacing {foo} (but not \${foo}) with &foo;..."
	#perl -p -i -e 's/([^\$$])\{(\w+)\}/\1\&$$2\;/g' xxml/MAIN-manager.xml
	#@ccecho result "Making .ent files available for validation..."
	#(cd xxml; ln -sf ../entities/*ent .)
