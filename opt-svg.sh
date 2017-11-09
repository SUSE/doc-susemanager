#!/bin/bash
# Add file names as parameters if you like.

me="$(test -L $(realpath $0) && readlink $(realpath $0) || echo $(realpath $0))"
mydir="$(dirname $me)"
where="$(pwd)"

files=
if [[ ! $1 ]]; then
  files=images/src/svg/*.svg
else
  while [[ $1 ]]; do
    files="$files $1"
    shift
  done
fi

echo -e "Handling files: $files\n"

for file in $files; do
  fileout=$(echo "$file" | sed -r 's/\.svg$//')
  if [[ ! $(grep '<!-- opt-svg marker' "$file") ]]; then
    xsltproc opt-svg.xsl "$file" > "${fileout}.optim.svg" 2> /dev/null
    echo "- Optimized output file: ${fileout}.optim.svg"
  else
    echo -e "- Input file ${file} already optimized.\n  Not trying again."
  fi
done
