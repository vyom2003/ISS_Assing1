#!/bin/bash
read -p "Enter String: " str
str1=$(echo $str | rev)
echo "Answer for part a: $str1"
echo -n "Answer for part b: "
echo $str1 | tr “[a-y]z[A-Y]Z” “[b-z]a[B-Z]A”
echo -n "Answer for part c: "
len=$(echo ${#str});
let "half = ($len)/2"
for ((i=$half-1;i>=0;i--))
do
{
    echo -n "${str:$i:1}"
}
done
for ((i=$half;i<len;i++))
do
{
    echo -n "${str:$i:1}"
}
done
echo