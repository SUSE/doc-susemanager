#!/bin/bash

asciidoctor-pdf pdf-constructor/product_architecture.adoc \
-a toc-title=Contents \
-a chapter-label= \
-a pdf-style=draft \
-a pdf-stylesdir=pdf-constructor \
-a icons=font \
-a pdf-fontsdir=fonts \
-a source-highlighter=coderay \
$1
