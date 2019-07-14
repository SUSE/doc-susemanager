#!/usr/bin/env bash

set -e

# Install rbenv dependencies
zypper --gpg-auto-import-keys ref
zypper --non-interactive install git tar automake gdbm-devel libyaml-devel sqlite3-devel ncurses-devel readline-devel zlib-devel git gcc libopenssl-devel wget curl bzip make
zypper --non-interactive clean --all

