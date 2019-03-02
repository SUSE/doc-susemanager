# Makefile for the Documentation

SHELL = bash
FONTS_DIR ?= fonts
STYLES_DIR ?= resources/themes
STYLE ?= suse
REVDATE ?= "$(shell date +'%B %d, %Y')"
CURDIR ?= .


PHONY: help
help: ## Print a basic help about the targets
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



.PHONY: pdf-all
pdf-all: pdf-install pdf-client-config pdf-upgrade pdf-reference pdf-administration pdf-salt pdf-retail pdf-architecture ## Generate PDF versions of the books


.PHONY: pdf-install
pdf-install: ## Generate PDF version of the Installation Guide
	asciidoctor-pdf \
		-a pdf-stylesdir=$(STYLES_DIR)/ \
		-a pdf-style=$(STYLE) \
		-a pdf-fontsdir=$(FONTS_DIR) \
		-a examplesdir=modules/installation/examples \
		-a imagesdir=modules/installation/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file suse_manager_installation_guide.pdf \
		pdf-constructor/product_installation_guide.adoc


.PHONY: pdf-client-config
pdf-client-config: ## Generate PDF version of the Client Configuraiton Guide
	asciidoctor-pdf \
		-a pdf-stylesdir=$(STYLES_DIR)/ \
		-a pdf-style=$(STYLE) \
		-a pdf-fontsdir=$(FONTS_DIR) \
		-a examplesdir=modules/client-configuration/examples \
		-a imagesdir=modules/client-configuration/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file suse_manager_client_configuration_guide.pdf \
		pdf-constructor/product_client_configuration_guide.adoc


.PHONY: pdf-upgrade
pdf-upgrade: ## Generate PDF version of the Upgrade Guide
	asciidoctor-pdf \
		-a pdf-stylesdir=$(STYLES_DIR)/ \
		-a pdf-style=$(STYLE) \
		-a pdf-fontsdir=$(FONTS_DIR) \
		-a examplesdir=modules/upgrade/examples \
		-a imagesdir=modules/upgrade/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file suse_manager_upgrade_guide.pdf \
		pdf-constructor/product_upgrade_guide.adoc


.PHONY: pdf-reference
pdf-reference: ## Generate PDF version of the Reference Manual
	asciidoctor-pdf \
		-a pdf-stylesdir=$(STYLES_DIR)/ \
		-a pdf-style=$(STYLE) \
		-a pdf-fontsdir=$(FONTS_DIR) \
		-a examplesdir=modules/reference/examples \
		-a imagesdir=modules/reference/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file suse_manager_reference_manual.pdf \
		pdf-constructor/product_reference_manual.adoc


.PHONY: pdf-administration
pdf-administration: ## Generate PDF version of the Administration Guide
	asciidoctor-pdf \
		-a pdf-stylesdir=$(STYLES_DIR)/ \
		-a pdf-style=$(STYLE) \
		-a pdf-fontsdir=$(FONTS_DIR) \
		-a examplesdir=modules/administration/examples \
		-a imagesdir=modules/administration/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file suse_manager_administration_guide.pdf \
		pdf-constructor/product_administration_guide.adoc


.PHONY: pdf-salt
pdf-salt: ## Generate PDF version of the Salt Guide
	asciidoctor-pdf \
		-a pdf-stylesdir=$(STYLES_DIR)/ \
		-a pdf-style=$(STYLE) \
		-a pdf-fontsdir=$(FONTS_DIR) \
		-a examplesdir=modules/salt/examples \
		-a imagesdir=modules/salt/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file suse_manager_salt_guide.pdf \
		pdf-constructor/product_salt_guide.adoc



.PHONY: pdf-retail
pdf-retail: ## Generate PDF version of the Retail Guide
	asciidoctor-pdf \
		-a pdf-stylesdir=$(STYLES_DIR)/ \
		-a pdf-style=$(STYLE) \
		-a pdf-fontsdir=$(FONTS_DIR) \
		-a examplesdir=modules/retail/examples \
		-a imagesdir=modules/retail/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir . \
		--out-file suse_manager_retail_guide.pdf \
		pdf-constructor/product_retail_guide.adoc


.PHONY: pdf-architecture
pdf-architecture: ## Generate PDF version of the Architecture Guide
	asciidoctor-pdf \
		-a pdf-stylesdir=$(STYLES_DIR)/ \
		-a pdf-style=$(STYLE) \
		-a pdf-fontsdir=$(FONTS_DIR) \
		-a examplesdir=modules/architecture/examples \
		-a imagesdir=modules/architecture/assets/images \
		-a revdate=$(REVDATE) \
		--base-dir $(CURDIR) \
		--out-file suse_manager_architecture.pdf \
		pdf-constructor/product_architecture.adoc


