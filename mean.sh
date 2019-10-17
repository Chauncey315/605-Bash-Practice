#!/bin/bash

if [[ $# -eq 0 || $# -ge 3 ]] ; then
  echo "$0 <column> [file.csv]" 1>&2
  exit 1

elif [[ $# -eq 2 || $# -eq 1 ]] ; then
  mean=$( (column=$1
  while read line; do
    echo "$line"
  done < "${2:-/dev/stdin}") | tail -n+2 | cut -d',' -f"$1" | awk '{sum+=$1}END{print sum/NR}' )
  file=$([ "$2" ] && echo "$2" || echo stdin)
  echo "The sample mean of column #$1 in $file = $mean"
else
  echo "Unkown error" 1>&2
  exit -1
fi
