#!/bin/bash
IFS=','
length=0;
read -a arr
let "length = ${#arr[@]}"
for((i=0;i< $length ;i++))
do
    for((j=0;j< $length -1;j++))
    do
    {
    if [ ${arr[j]} -gt ${arr[$((j+1))]} ]
    then
    {
    temp=${arr[j]}
    arr[$j]=${arr[$((j+1))]}  
    arr[$((j+1))]=$temp
    }
    fi
    }
    done
done
echo ${arr[*]}
