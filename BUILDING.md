# How to build the docs

## Required packages

* daps
* suse-xsl-stylesheets
* fop (for PDFs)

## Make targets

* all: build everything
* html: build html variants
* pdf: build pdf variants (needs `fop`)
* quick: quickstart (html + pdf)
* quick-html: quickstart (html only)
* quick-pdf: quickstart (pdf only)
* package: tarball for packaging

