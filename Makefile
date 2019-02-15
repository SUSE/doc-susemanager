PRODUCTNAME=

uyuni:
	$(eval PRODUCTNAME = Uyuni)

mgr:
	$(eval PRODUCTNAME = SUSE Manager)

xml-mgr: xml/MAIN-manager.xml mgr-images

xml-uyuni: xml/MAIN-manager.xml uyuni-images

mgr-images: adoc/images/mgr/*
	mkdir -p images/src
	(mkdir -p images/src/png; cd images/src/png; ln -sf ../../../adoc/images/mgr/*.png .)
	(mkdir -p images/src/svg; cd images/src/svg; ln -sf ../../../adoc/images/mgr/*.svg .)

uyuni-images: adoc/images/uyuni/*
	mkdir -p images/src
	(mkdir -p images/src/png; cd images/src/png; ln -sf ../../../adoc/images/uyuni/*.png .)
	(mkdir -p images/src/svg; cd images/src/svg; ln -sf ../../../adoc/images/uyuni/*.svg .)

# <PRODUCTNAME> asciidoctor processing instructions and entity linking
xml/MAIN-manager.xml: adoc/*.adoc
	rm -rf xml/MAIN-manager.xml
	asciidoctor -a productname='$(PRODUCTNAME)' -b docbook5 -d book -D xxml adoc/MAIN-manager.adoc
	rm -rf xml
	mv xxml xml

# MANAGER book-to-set stylesheet. Run first on xml/MAIN-manager.xml for creation of single books
book-to-set: mgr xml-mgr
	cp xml/MAIN-manager.xml book-to-set/MAIN-manager.xml
	(cd book-to-set; ln -sf ../entities/*ent .)
	(cd book-to-set/; xsltproc book2set.xsl MAIN-manager.xml > test.xml)
	mkdir -p book-to-set/xml
	mv book-to-set/test.xml book-to-set/xml/MAIN-manager.xml
	cd book-to-set/; daps -m xml/MAIN-manager.xml validate
	cp book-to-set/xml/MAIN-manager.xml xml/MAIN-manager.xml

# UYUNI book-to-set stylesheet. Run first on xml/MAIN-manager.xml for creation of single books
book-to-set-uyuni: uyuni xml-uyuni
	cp xml/MAIN-manager.xml book-to-set/MAIN-manager.xml
	(cd book-to-set; ln -sf ../entities/*ent .)
	(cd book-to-set/; xsltproc book2set.xsl MAIN-manager.xml > test.xml)
	mkdir -p book-to-set/xml
	mv book-to-set/test.xml book-to-set/xml/MAIN-manager.xml
	cd book-to-set/; daps -m xml/MAIN-manager.xml validate
	cp book-to-set/xml/MAIN-manager.xml xml/MAIN-manager.xml

# UYUNI DOCUMENTATION OUTPUTS
# Create all Uyuni docs (HTML)
uyuni-html: uyuni xml-uyuni
	daps -d DC-create-all-uyuni html
	(cd build/create-all/html/create-all; rm -rf images; ln -sf ../../../../adoc/images/uyuni .)

# Make Uyuni Packages for OBS
uyuni-dist: uyuni xml-uyuni
	daps -vvv -d DC-create-all-uyuni package-src --set-date=$(date --iso) --def-file DEF-susemanager-docs-adoc

# PDF FILES (UYUNI)
# UYUNI CREATE ALL (SINGLE PDF Book)
uyuni-pdf: uyuni xml-uyuni
	daps -d DC-create-all-uyuni pdf

# UYUNI ARCHITECTURE
uyuni-architecture-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-architecture pdf

# UYUNI INSTALLATION GUIDE
uyuni-install-guide-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-install-guide pdf

# UYUNI CLIENT CONFIGURATION GUIDE
uyuni-client-config-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-client-config-guide pdf

# UYUNI UPGRADE GUIDE
uyuni-upgrade-guide-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-upgrade-guide pdf

# UYUNI ADMINISTRATION GUIDE
uyuni-administration-guide-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-administration-guide pdf

# UYUNI REFERENCE MANUAL
uyuni-reference-manual-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-reference-manual pdf

# UYUNI SALT GUIDE
uyuni-salt-guide-pdf: uyuni xml-uyuni
	daps -d DC-uyuni-salt-guide pdf

# HTML (UYUNI) Chunked & single
uyuni-architecture-html: uyuni xml-uyuni
	daps -d DC-uyuni-architecture html
	daps -d DC-uyuni-architecture html --single

uyuni-install-guide-html: uyuni xml-uyuni
	daps -d DC-uyuni-install-guide html
	daps -d DC-uyuni-install-guide html --single

uyuni-client-config-guide-html: uyuni xml-uyuni
	daps -d DC-uyuni-client-config-guide html
	daps -d DC-uyuni-client-config-guide html --single

uyuni-upgrade-guide-html: uyuni xml-uyuni
	daps -d DC-uyuni-upgrade-guide html
	daps -d DC-uyuni-upgrade-guide html --single

uyuni-administration-guide-html: uyuni xml-uyuni
	daps -d DC-uyuni-administration-guide html
	daps -d DC-uyuni-administration-guide html --single

uyuni-reference-manual-html: uyuni xml-uyuni
	daps -d DC-uyuni-reference-manual html
	daps -d DC-uyuni-reference-manual html --single

uyuni-salt-guide-html: uyuni xml-uyuni
	daps -d DC-uyuni-salt-guide html
	daps -d DC-uyuni-salt-guide html --single

# MANAGER DOCUMENTATION OUTPUTS
# CREATE ALL MANAGER DOCS (HTML)
mgr-html: mgr xml-mgr
	daps -d DC-create-all html
	(cd build/create-all/html/create-all; ln -sf ../../../../../adoc/images/mgr .)

# MANAGER Packages for BUILD SERVICE
mgr-dist: mgr xml-mgr
	daps -vvv -d DC-create-all package-src --set-date=$(date --iso) --def-file DEF-susemanager-docs-adoc

# PDF FILES (MANAGER)
# MANAGER CREATE ALL (SINGLE PDF Book)
mgr-pdf: mgr xml-mgr
	daps -d DC-create-all pdf

# MANAGER ARCHITECTURE
mgr-architecture-pdf: mgr xml-mgr
	daps -d DC-mgr-architecture pdf

# MANAGER INSTALLATION GUIDE
mgr-install-guide-pdf: mgr xml-mgr
	daps -d DC-mgr-install-guide pdf

# MANAGER CLIENT CONFIGURATION GUIDE
mgr-client-config-guide-pdf: mgr xml-mgr
	daps -d DC-mgr-client-config-guide pdf

# MANAGER ADMINISTRATION GUIDE
mgr-upgrade-guide-pdf: mgr xml-mgr
	daps -d DC-mgr-upgrade-guide pdf

# MANAGER UPGRADE GUIDE
mgr-administration-guide-pdf: mgr xml-mgr
	daps -d DC-mgr-administration-guide pdf

# MANAGER REFERENCE MANUAL
mgr-reference-manual-pdf: mgr xml-mgr
	daps -d DC-mgr-reference-manual pdf

# MANAGER SALT GUIDE
mgr-salt-guide-pdf: mgr xml-mgr
	daps -d DC-mgr-salt-guide pdf

# HTML (MANAGER) Chunked & single
mgr-architecture-html: xml-mgr
	daps -d DC-architecture html
	daps -d DC-architecture html --single

mgr-install-guide-html: xml-mgr
	daps -d DC-mgr-install-guide html
	daps -d DC-mgr-install-guide html --single

mgr-client-config-guide-html: xml-mgr
	daps -d DC-client-config-guide html
	daps -d DC-client-config-guide html --single

mgr-upgrade-guide-html: xml-mgr
	daps -d DC-mgr-upgrade-guide html
	daps -d DC-mgr-upgrade-guide html --single

mgr-reference-html: xml-mgr
	daps -d DC-mgr-reference-manual html
	daps -d DC-mgr-reference-manual html --single

mgr-salt-guide-html: xml-mgr
	daps -d DC-mgr-salt-guide html
	daps -d DC-mgr-salt-guide html --single

#TODO Add retail section from DEVELOP BRANCH
# Removed for "simplicity" during IA rework
# RETAIL GOES HERE [...........]

#TODO See if we can resolve online-docs, this would make publishing with Arul simpler. (DB5 -> DB4 novdoc)
# Target for www.suse.com/documentation (BROKEN ATM, USE ANTORA SITE GENERATOR)
#suma-online-docs:
#	daps -d DC-create-all online-docs
#uyuni-online-docs:
#	daps -d DC-create-all-uyuni --force online-docs

start-clean:
	rm -rf package/doc-susemanager-develop.tar.bz2
	rm -rf package/*~
	rm -rf images
	rm -rf xml
	rm -rf xxml
	rm -rf build
	rm -rf book-to-set/build
	rm -rf book-to-set/xml
	rm book-to-set/MAIN-manager.xml

uyuni-clean:
	rm -rf xml
	rm -rf xxml
	rm -rf book-to-set/build
	rm -rf book-to-set/xml/*
	rm book-to-set/MAIN-manager.xml
	rm -rf images
	rm -rf build/.profiled
	rm -rf build/.images

mgr-clean:
	rm -rf xml
	rm -rf xxml
	rm -rf book-to-set/build/
	rm -rf book-to-set/xml
	rm book-to-set/MAIN-manager.xml
	rm -rf images
	rm -rf build/.profiled
	rm -rf build/.images

# Keep for reference used for entities during xml -> adoc transition
	#@ccecho result "Inserting entities from doc-susemanager/entities..."
	#sed -i '2i <!DOCTYPE set [ <!ENTITY % entities SYSTEM "entity-decl.ent"> %entities; ]>' xxml/MAIN-manager.xml
	#@ccecho result "Replacing {foo} (but not \${foo}) with &foo;..."
	#perl -p -i -e 's/([^\$$])\{(\w+)\}/\1\&$$2\;/g' xxml/MAIN-manager.xml
	#@ccecho result "Making .ent files available for validation..."
	#(cd xxml; ln -sf ../entities/*ent .)
