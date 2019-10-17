#!/bin/bash

grep "MADISON SCHOOLS" ../Property_Tax_Roll.csv > ../madison.csv
sum=0 ; count=0
awk -F "," '{ sum += $7 } {count += 1 } END { print sum/count }' ../madison.csv



