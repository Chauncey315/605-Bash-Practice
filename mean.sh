#!/bin/bash

if [[ $# -eq 0 || $# -ge 3 ]]; then
  echo "$0 <column> [file.csv]" 1>&2
  exit 1

elif [ $# -eq 2 ]; then
  column=$1
  csvFl=$2
  # awk -F"," -v col="$column" 'NR!=1{sum+=$'col'}END{print sum}' $csvFl
  popu=`cut -d, -f${column} $csvFl | tail -n +2`
  count=0
  sum=0
  for sample in ${popu}; do
    let "count += 1"
    let "sum += $sample"
  done
  echo "count=$count, sum=$sum"
  mean=$(echo "scale=2; ${sum}/${count}" | bc)
  echo "The sample mean of column #${column} in file ${csvFl} = ${mean}."

elif [ $# -eq 1 ]; then
  column=$1
  while read line; do
    echo "$line"
  done < /dev/stdin > tmpData.csv
  csvFl=tmpData.csv
  popu=`cut -d, -f${column} $csvFl | tail -n +2`
  count=0
  sum=0
  for sample in ${popu}; do
    let "count += 1"
    let "sum += $sample"
  done
  echo "count=$count, sum=$sum"
  mean=$(echo "scale=2; ${sum}/${count}" | bc)
  echo "The sample mean of column #${column} from stdin = ${mean}"
  rm $csvFl

else
  echo "Unkown error" 1>&2
  exit -1
fi
