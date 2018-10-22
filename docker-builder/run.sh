#!/bin/bash
# docker build . -t daps-builder -f Dockerfile
# docker run --rm -v /home/coyote/workspace/doc-susemanager:/workspace daps-builder

make clean

# Create the correct links and apply DB5 geekodoc stylesheet (Required for publishing and packaging) 
# Create Uyuni opensource outputs

make book-to-set-uyuni

# Create all Uyuni (Single HTML)
make uyuni-html

# Uyuni OBS Packages
make uyuni-dist

# Uyuni HTML Single/Chunked books
make uyuni-advanced-html
make uyuni-best-practices-html
make uyuni-getting-started-html
make uyuni-reference-html

# Uyuni PDF
#make uyuni-getting-started-pdf
#make uyuni-reference-pdf
#make uyuni-advanced-pdf
#make uyuni-best-practices-pdf


# Create SUMA product outputs

#make book-to-set

# Create all SUMA (Single HTML)
#make suma-html

# SUMA OBS Packages
#make suma-dist

# SUMA HTML Single/Chunked books
#make suma-advanced-html
#make suma-best-practices-html
#make suma-getting-started-html
#make suma-reference-html

# SUMA PDF
#make suma-getting-started-pdf
#make suma-reference-pdf
#make suma-advanced-pdf
#make suma-best-practices-pdf

# SUMA for Retail

#make retail-getting-started-html


