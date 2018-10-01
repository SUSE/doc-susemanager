#!/bin/bash
set -e
zypper --gpg-auto-import-keys ref
#zypper ar https://download.opensuse.org/repositories/home:/beyerle:/IAC/openSUSE_Leap_15.0/ asciidocctor-repo
zypper --non-interactive in ruby ruby2.5-rubygem-bundler nodejs8 git gcc libopenssl-devel sqlite3-devel ruby2.5 ruby2.5-devel ruby2.5-rubygem-asciidoctor bzip
