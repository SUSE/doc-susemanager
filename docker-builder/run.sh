#!/bin/bash

###########
# Cleanup #
###########

make clean

######################################################################################################
# Create the correct links and apply DB5 geekodoc stylesheet (Required for publishing and packaging) #
######################################################################################################

make book-to-set

###################################
# Create Uyuni opensource outputs #
###################################

# Create all Uyuni (Single HTML)
make uyuni-html

# Uyuni OBS Packages
make uyuni-dist



#############################
# Create SUMA product outputs
#############################

# Create all SUMA (Single HTML)
make suma-html

# SUMA OBS Packages
make suma-dist

# SUMA HTML Single/Chunked books
make suma-advanced-html
make suma-best-practices-html
make suma-getting-started-html
make suma-reference-html

# SUMA PDF
make suma-getting-started-pdf
make suma-reference-pdf
make suma-advanced-pdf
make suma-best-practices-pdf

# SUMA Online docs (Currently Broken, waiting on fix. Instead of online-docs we will publish a static site with antora.)
#make suma-online-docs
