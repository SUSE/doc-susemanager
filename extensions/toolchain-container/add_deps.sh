#!/usr/bin/env bash

set -e

# Install rbenv dependencies
zypper --gpg-auto-import-keys ref
zypper --non-interactive install git tar automake gdbm-devel libyaml-devel unzip sqlite3-devel ncurses-devel readline-devel zlib-devel git gcc gzip libopenssl-devel wget curl bzip make ruby2.5 ruby2.5-devel vim
zypper --non-interactive clean --all

