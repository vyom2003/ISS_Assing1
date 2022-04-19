#!/bin/bash
file=$1
IFS='~'
while read line; do
if [ -z "$line" ]
then
echo "$line"
else
read -a wordarr <<< "$line"
echo -n ${wordarr[1]}
echo -n " once said " '"'
echo ${wordarr[0]} '"'
fi
done <$file >speech.txt
