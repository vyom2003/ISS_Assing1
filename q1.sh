#!/bin/bash
file=$1
sed -E '/^$/d' < $file > output.txt
awk '!seen[$0]++' < output.txt
