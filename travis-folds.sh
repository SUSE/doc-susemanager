#!/bin/bash -e
#
# From the GitHub repository:
# https://github.com/SUSE/doc-susemanager
#
# License: MIT
#
# Written by Thomas Schraitle
# Modified by Joseph Cayouette

RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'
BOLD='\e[1m'
RESET='\e[0m' # No Color

TRAVIS_FOLD_IDS=""


log() {
  # $1 - optional: string: "+" for green color, "-" for red color
  # $2 - message
  colorcode="$BLUE"
  [[ "$1" == '+' ]] && colorcode="$GREEN" && shift
  [[ "$1" == '-' ]] && colorcode="$RED" && shift
  echo -e "$colorcode${1}$RESET"
}


fail() {
  # $1 - message
  echo -e "$RED$BOLD${1}$RESET"
  exit 1
}


succeed() {
  # $1 - message
  echo -e "$GREEN$BOLD${1}$RESET"
  exit 0
}


travis_fold() {
  humanname="$1"
  type='start'
  current_id="fold_"$(( ( RANDOM % 32000 ) + 1 ))
  if [[ $1 == '--' ]]; then
    humanname=''
    type='end'
    current_id=$(echo "$TRAVIS_FOLD_IDS" | grep -oP 'fold_[0-9]+$')
    TRAVIS_FOLD_IDS=$(echo "$TRAVIS_FOLD_IDS" | sed -r "s/ $current_id\$//")
  else
    TRAVIS_FOLD_IDS+=" $current_id"
  fi
  echo -en "travis_fold:$type:$current_id\\r" && log "$humanname"
}


#travis_fold "Build Lunr Docker Image"
#docker build -t lunr/antora:custom -f Dockerfile.custom .
#travis_fold --


travis_fold "Install Asciidoctor"
gem install asciidoctor
asciidoctor --version
travis_fold --


travis_fold "Install Asciidoctor PDF and Requirements"
gem install asciidoctor-pdf --pre
gem install rouge
gem install pygments.rb
gem install coderay
asciidoctor-pdf --version
travis_fold --


travis_fold "Install Antora Xref Validator"
npm i -g @antora/cli@2.1 @antora/site-generator-default@2.1
npm install -g gitlab:antora/xref-validator
travis_fold --


travis_fold "Build SUMA BOOKS (PDF)"
make pdf-all-suma
travis_fold --


travis_fold "Create Tarball of all PDFS"
make pdf-tar-suma
travis_fold --


travis_fold "Validate XREFS"
NODE_PATH="$(npm -g root)" antora --generator @antora/xref-validator suma-site.yml
travis_fold --

succeed "We're done."
