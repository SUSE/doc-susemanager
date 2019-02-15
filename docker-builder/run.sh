#!/bin/bash
# docker build . -t daps-builder -f Dockerfile
# docker run --rm -v /home/coyote/workspace/doc-susemanager:/workspace daps-builder

make start-clean

# Create the correct links and apply DB5 geekodoc stylesheet (Required for publishing and packaging) 
# Create Uyuni opensource outputs
make uyuni-clean
make book-to-set-uyuni

# Create all Uyuni (Single HTML)
make uyuni-html

# Uyuni OBS Packages
make uyuni-dist

#TODO make ONE command that builds each book/output.. this is method=stupid
# UYUNI HTML Single/Chunked books
#make uyuni-architecture-html
#make uyuni-install-guide-html
#make uyuni-client-config-guide-html
#make uyuni-upgrade-guide-html
#make uyuni-administration-guide-html
#make uyuni-reference-manual-html
#make uyuni-salt-guide-html

# Uyuni PDF
#make uyuni-architecture-pdf
#make uyuni-install-guide-pdf
#make uyuni-client-config-guide-pdf
#make uyuni-upgrade-guide-pdf
#make uyuni-administration-guide-pdf
#make uyuni-reference-manual-pdf
#make uyuni-salt-guide-pdf

# Create MANAGER product outputs
make mgr-clean
make book-to-set

# Create all MANAGER (Single HTML)
make mgr-html

# MANAGER OBS Packages
make mgr-dist

# MANAGER HTML Single/Chunked books
#make mgr-architecture-html
#make mgr-install-guide-html
#make mgr-client-config-guide-html
#make mgr-upgrade-guide-html
#make mgr-administration-guide-html
#make mgr-reference-manual-html
#make mgr-salt-guide-html

# MANAGER PDF
#make mgr-architecture-pdf
#make mgr-install-guide-pdf
#make mgr-client-config-guide-pdf
#make mgr-upgrade-guide-pdf
#make mgr-administration-guide-pdf
#make mgr-reference-manual-pdf
#make mgr-salt-guide-pdf


