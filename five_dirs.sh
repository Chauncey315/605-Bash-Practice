#!/bin/bash

# Make a directory five and four files in each subdirectory
mkdir ./five
for ((i=1; i<=5; i++)); do
    mkdir ./five/dir$i
    for ((j=1; j<=4; j++)); do
	touch ./five/dir$i/file$j.txt
	for ((z=1; z<=j; z++)); do
	    echo $j >> ./five/dir$i/file$j.txt
	done
    done
done
    
