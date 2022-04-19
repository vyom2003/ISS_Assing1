#!/bin/bash
file=$1
#a
perl -e '@x=stat(shift);print $x[7]' $file
echo
#b
count_line=0;
while read line;do
let "count_line = count_line + 1"
done <$file
echo $count_line
count_word=0;
#c
while read line;do
read -a arr <<<$line
let "count_word = count_word + ${#arr[@]}"
done <$file
echo $count_word
#d
while read line;do
read -a arr <<<$line
echo "Line No: $count - ${#arr[@]}"
let "count = count +1"
done <$file
#e
read -a array<<<"$(sed -e ' s/[^A-Za-z]/ /g' $file | tr 'A-Z' 'a-z' | tr ' ' '\n'| sort | tr '\n' ' ')"
len=${#array[@]}
word=${array[0]}
freq=1;
for ((i=1;i<len;i++))
do
{
    if [[ "${array[$i]}" = "$word" ]];then
    let "freq = freq + 1"
    else
    {
    echo "Word : $word - Frequency : $freq"
    freq=1
    word=${array[$i]}
    }
    fi
}
done
echo "Word : $word - Frequency : $freq"