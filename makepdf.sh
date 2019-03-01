#!/bin/bash

docker run -it -v  /home/coyote/workspace/doc-susemanager-publisher/workspace/doc-susemanager/pdf_template/installation-guide-pdf:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf book_mgr_installation.adoc \
-a toc-title=Contents \
-a chapter-label= \
-a pdf-style=draft \
-a pdf-stylesdir=./ \
-a icons=font \
-a pdf-fontsdir=fonts \
-a source-highlighter=coderay \
$1
