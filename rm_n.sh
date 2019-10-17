#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "usage: $0 <dir> <n>" 1>&2
  exit -1
fi

dir=$1
sizeByte=$2

delFile=`find $dir -type f -size +${sizeByte}c`

for i in ${delFile}; do
  rm -iv $i
done

exit 0
