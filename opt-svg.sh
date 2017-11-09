#!/bin/bash
# Optimize SVG images for embedding as inlinemediaobjects by scaling them to
# a standard size. This is only meant to work for relatively simple SVGs. It
# will run into issues with SVGs that use e.g. gradients or are exported by
# Adobe software.
#
# Usage:
# 1. $0 [--norename] [--size WIDTHxHEIGHT] [FILES]
# 2. $0 --help
#
# * All parameters are optional
# * --norename reuses the original file name instead of adding .optim to it
#   (dangerous if used without an explicit list of files)
# * --size takes a value of WIDTHxHEIGHT (default: 32x32)
# * If no files are given, $0 converts every file that matches
#   src/images/svg/*.svg

me="$(test -L $(realpath $0) && readlink $(realpath $0) || echo $(realpath $0))"
mydir="$(dirname $me)"
where="$(pwd)"

if [[ $1 == '--help' ]] || [[ $1 == '-h' ]]; then
  sed -rn '/#!/{n; p; :loop n; p; /^[ \t]*$/q; b loop}' $0 | sed -r -e 's/^# ?//' -e "s/\\\$0/$(basename $0)/g"
  exit
fi

rename=".optim.svg"

width=32
height=32

for parameter in $@; do
  if [[ $1 == '--norename' ]] || [[ $1 == '--no-rename' ]] || [[ $1 == '-n' ]]; then
    rename=".svg"
    shift
  elif [[ $1 == '--size' ]] || [[ $1 == '-s' ]]; then
    shift
    if [[ ! $(echo -n "$1" | sed -r 's/^[0-9]+x[0-9]+//') ]]; then
      width=$(echo "$1" | grep -oP '^[0-9]+')
      height=$(echo "$1" | grep -oP '[0-9]+$')
    else
      echo "--size value does not match format WIDTHxHEIGHT."
      exit
    fi
    shift
  elif [[ $1 == '--' ]]; then
    shift
    break
  else
    break
  fi
done


files=
if [[ ! $1 ]]; then
  files=images/src/svg/*.svg
else
  while [[ $1 ]]; do
    files="$files $1"
    shift
  done
fi

if [[ $files == '' ]]; then
  echo "There seem to be no files to handle. (A typo maybe?)"
  exit
fi

echo -e "Handling files: $files\n"

for file in $files; do
  fileout=${file%.svg}
  if [[ ! $(grep '<!-- opt-svg marker' "$file") ]]; then
    xsltproc \
      --param targetwidth $width \
      --param targetheight $height \
      opt-svg.xsl \
      "$file" \
      > "${fileout}0${rename}" \
      2> /dev/null
    mv "${fileout}0${rename}" "${fileout}${rename}"
    echo "- Optimized output file: ${fileout}${rename}"
  else
    echo -e "- Input file ${file} already optimized.\n  Not trying again."
  fi
done
