# Makefile for SUSE Manager/Uyuni Documentation
# Author: Joseph Cayouette
# Inspired/modified from Owncloud's documentation Makefile written by Matthew Setter
SHELL = bash


# SUMA Productname and file replacement
PRODUCTNAME_SUMA ?= 'SUSE Manager'
FILENAME_SUMA ?= suse_manager


# UYUNI Productname and file replacement
PRODUCTNAME_UYUNI ?= Uyuni
FILENAME_UYUNI ?= uyuni


# PDF Resource Locations
PDF_FONTS_DIR ?= branding/pdf/fonts
PDF_THEME_DIR ?= branding/pdf/themes


# PDF Publishing Themes, draft uses a draft watermark.
# SUMA PDF Themes
# Available Choices set variable
# suse-draft
# suse

PDF_THEME_SUMA ?= suse-draft


# UYUNI PDF Themes
# Available Choices set variable
# uyuni-draft
# uyuni

PDF_THEME_UYUNI ?= uyuni


REVDATE ?= "$(shell date +'%B %d, %Y')"
CURDIR ?= .


# Build directories for TAR
HTML_BUILD_DIR ?= build
PDF_BUILD_DIR ?= build/pdf


# SUMA OBS Tarball Filenames
HTML_OUTPUT_SUMA ?= susemanager-docs_en
PDF_OUTPUT_SUMA ?= susemanager-docs_en-pdf


# UYUNI OBS Tarball Filenames
HTML_OUTPUT_UYUNI ?= uyuni-docs_en
PDF_OUTPUT_UYUNI ?= uyuni-docs_en-pdf


# Help Menu
PHONY: help
help: ## Prints a basic help menu about available targets
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/:/'`); \
	printf "%-30s %s\n" "target" "help" ; \
	printf "%-30s %s\n" "------" "----" ; \
	for help_line in $${help_lines[@]}; do \
		IFS=$$':' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf '\033[36m'; \
		printf "%-30s %s" $$help_command ; \
		printf '\033[0m'; \
		printf "%s\n" $$help_info; \
	done


# Clean up build artifacts
.PHONY: clean
clean: ## Remove build artifacts from output directory (Antora and PDF)
	-rm -rf build/ .cache/ public/


# SUMA DOCUMENTATION BUILD COMMANDS

# To build for suma-webui or uyuni you need to comment out the correct name/title in the antora.yml file. (TODO remove this manual method.)
.PHONY: antora-suma
antora-suma: clean pdf-all-suma ## Build the SUMA Antora static site (See README for more information)
		sed -i "s/^ # *\(name: *suse-manager\)/\1/;\
	s/^ # *\(title: *SUSE Manager\)/\1/;\
	s/^ # *\(start_page: *ROOT:index-suma\)/\1/;\
	s/^ *\(title: *Uyuni\)/#\1/;\
	s/^ *\(name: *uyuni\)/#\1/;\
	s/^ *\(start_page: *ROOT:index-uyuni\)/#\1/;" antora.yml
		docker run -u 1000 -v `pwd`:/antora --rm -t antora/antora:latest suma-site.yml



# SUMA
.PHONY: obs-packages-suma
obs-packages-suma: clean pdf-all-suma antora-suma ## Generate SUMA OBS tar files
	tar --exclude='$(PDF_BUILD_DIR)' -czvf $(HTML_OUTPUT_SUMA).tar.gz $(HTML_BUILD_DIR)
	tar -czvf $(PDF_OUTPUT_SUMA).tar.gz $(PDF_BUILD_DIR)
	mkdir build/packages
	mv $(HTML_OUTPUT_SUMA).tar.gz $(PDF_OUTPUT_SUMA).tar.gz build/packages



.PHONY: pdf-all-suma
pdf-all-suma: pdf-install-suma pdf-client-config-suma pdf-upgrade-suma pdf-reference-suma pdf-administration-suma pdf-salt-suma pdf-retail-suma ##pdf-architecture-suma-webui ## Generate PDF versions of all SUMA books



.PHONY: pdf-install-suma
pdf-install-suma: ## Generate PDF version of the SUMA Installation Guide
	asciidoctor-pdf \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_SUMA) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_SUMA) \
		-a examplesdir=modules/installation/examples \
		-a imagesdir=modules/installation/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_SUMA)_installation_guide.pdf \
		modules/installation/nav-installation-guide.adoc



.PHONY: pdf-client-config-suma
pdf-client-config-suma: ## Generate PDF version of the SUMA Client Configuraiton Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_SUMA) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_SUMA) \
		-a examplesdir=modules/client-configuration/examples \
		-a imagesdir=modules/client-configuration/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_SUMA)_client_configuration_guide.pdf \
		modules/client-configuration/nav-client-config-guide.adoc



.PHONY: pdf-upgrade-suma
pdf-upgrade-suma: ## Generate PDF version of the SUMA Upgrade Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_SUMA) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_SUMA) \
		-a examplesdir=modules/upgrade/examples \
		-a imagesdir=modules/upgrade/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_SUMA)_upgrade_guide.pdf \
		modules/upgrade/nav-upgrade-guide.adoc



.PHONY: pdf-reference-suma
pdf-reference-suma: ## Generate PDF version of the SUMA Reference Manual
	asciidoctor-pdf \
	    -r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_SUMA) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_SUMA) \
		-a examplesdir=modules/reference/examples \
		-a imagesdir=modules/reference/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_SUMA)_reference_manual.pdf \
		modules/reference/nav-reference-manual.adoc



.PHONY: pdf-administration-suma
pdf-administration-suma: ## Generate PDF version of the SUMA Administration Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_SUMA) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_SUMA) \
		-a examplesdir=modules/administration/examples \
		-a imagesdir=modules/administration/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_SUMA)_administration_guide.pdf \
		modules/administration/nav-administration-guide.adoc



.PHONY: pdf-salt-suma
pdf-salt-suma: ## Generate PDF version of the SUMA Salt Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_SUMA) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_SUMA) \
		-a examplesdir=modules/salt/examples \
		-a imagesdir=modules/salt/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_SUMA)_salt_guide.pdf \
		modules/salt/nav-salt-guide.adoc



.PHONY: pdf-retail-suma
pdf-retail-suma: ## Generate PDF version of the SUMA Retail Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_SUMA) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_SUMA) \
		-a examplesdir=modules/retail/examples \
		-a imagesdir=modules/retail/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_SUMA)_retail_guide.pdf \
		modules/retail/nav-retail.adoc



.PHONY: pdf-architecture-suma
pdf-architecture-suma: ## Generate PDF version of the SUMA Architecture Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a productname=$(PRODUCTNAME) \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_SUMA) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_SUMA) \
		-a examplesdir=modules/architecture/examples \
		-a imagesdir=modules/architecture/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir $(CURDIR) \
	 	--out-file $(PDF_BUILD_DIR)/$(FILENAME_SUMA)_architecture.pdf \
		modules/architecture/nav-architecture-components-guide.adoc



# UYUNI DOCUMENTATION BUILD COMMANDS

.PHONY: antora-uyuni
antora-uyuni: clean pdf-all-uyuni ## Build the UYUNI Antora static site (See README for more information)
		sed -i "s/^ *\(name: *suse-manager\)/#\1/;\
s/^ *\(title: *SUSE Manager\)/#\1/;\
s/^ *\(start_page: *ROOT:index-suma\)/#\1/;\
s/^ *# *\(title: *Uyuni\)/\1/;\
s/^ *# *\(name: *uyuni\)/\1/;\
s/^ *# *\(start_page: *ROOT:index-uyuni\)/\1/;" antora.yml
		docker run -u 1000 -v `pwd`:/antora --rm -t antora/antora:latest uyuni-site.yml



# UYUNI
.PHONY: obs-packages-uyuni
obs-packages-uyuni: clean pdf-all-uyuni antora-uyuni ## Generate UYUNI OBS tar files
	tar --exclude='$(PDF_BUILD_DIR)' -czvf $(HTML_OUTPUT_UYUNI).tar.gz $(HTML_BUILD_DIR)
	tar -czvf $(PDF_OUTPUT_UYUNI).tar.gz $(PDF_BUILD_DIR)
	mkdir build/packages
	mv $(HTML_OUTPUT_UYUNI).tar.gz $(PDF_OUTPUT_UYUNI).tar.gz build/packages



.PHONY: pdf-all-uyuni
pdf-all-uyuni: pdf-install-uyuni pdf-client-config-uyuni pdf-upgrade-uyuni pdf-reference-uyuni pdf-administration-uyuni pdf-salt-uyuni pdf-retail-uyuni pdf-architecture-uyuni ## Generate PDF versions of all UYUNI books



.PHONY: pdf-install-uyuni
pdf-install-uyuni: ## Generate PDF version of the UYUNI Installation Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_UYUNI) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_UYUNI) \
		-a examplesdir=modules/installation/examples \
		-a imagesdir=modules/installation/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_UYUNI)_installation_guide.pdf \
		modules/installation/nav-installation-guide.adoc



.PHONY: pdf-client-config-uyuni
pdf-client-config-uyuni: ## Generate PDF version of the UYUNI Client Configuraiton Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_UYUNI) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_UYUNI) \
		-a examplesdir=modules/client-configuration/examples \
		-a imagesdir=modules/client-configuration/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_UYUNI)_client_configuration_guide.pdf \
		modules/client-configuration/nav-client-config-guide.adoc



.PHONY: pdf-upgrade-uyuni
pdf-upgrade-uyuni: ## Generate PDF version of the UYUNI Upgrade Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_UYUNI) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_UYUNI) \
		-a examplesdir=modules/upgrade/examples \
		-a imagesdir=modules/upgrade/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_UYUNI)_upgrade_guide.pdf \
		modules/upgrade/nav-upgrade-guide.adoc



.PHONY: pdf-reference-uyuni
pdf-reference-uyuni: ## Generate PDF version of the UYUNI Reference Manual
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_UYUNI) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_UYUNI) \
		-a examplesdir=modules/reference/examples \
		-a imagesdir=modules/reference/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_UYUNI)_reference_manual.pdf \
		modules/reference/nav-reference-manual.adoc



.PHONY: pdf-administration-uyuni
pdf-administration-uyuni: ## Generate PDF version of the UYUNI Administration Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_UYUNI) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_UYUNI) \
		-a examplesdir=modules/administration/examples \
		-a imagesdir=modules/administration/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_UYUNI)_administration_guide.pdf \
		modules/administration/nav-administration-guide.adoc



.PHONY: pdf-salt-uyuni
pdf-salt-uyuni: ## Generate PDF version of the UYUNI Salt Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_UYUNI) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_UYUNI) \
		-a examplesdir=modules/salt/examples \
		-a imagesdir=modules/salt/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_UYUNI)_salt_guide.pdf \
		modules/salt/nav-salt-guide.adoc



.PHONY: pdf-retail-uyuni
pdf-retail-uyuni: ## Generate PDF version of the UYUNI Retail Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_UYUNI) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME_UYUNI) \
		-a examplesdir=modules/retail/examples \
		-a imagesdir=modules/retail/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file $(PDF_BUILD_DIR)/$(FILENAME_UYUNI)_retail_guide.pdf \
		modules/retail/nav-retail.adoc



.PHONY: pdf-architecture-uyuni
pdf-architecture-uyuni: ## Generate PDF version of the UYUNI Architecture Guide
	asciidoctor-pdf \
		-r ./extensions/xref-converter.rb \
		-a productname=$(PRODUCTNAME_UYUNI) \
		-a pdf-stylesdir=$(PDF_THEME_DIR)/ \
		-a pdf-style=$(PDF_THEME_UYUNI) \
		-a pdf-fontsdir=$(PDF_FONTS_DIR) \
		-a productname=$(PRODUCTNAME) \
		-a examplesdir=modules/architecture/examples \
		-a imagesdir=modules/architecture/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir $(CURDIR) \
	 	--out-file $(PDF_BUILD_DIR)/$(FILENAME_UYUNI)_architecture.pdf \
		modules/architecture/nav-architecture-components-guide.adoc
