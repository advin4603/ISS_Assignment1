#!/bin/bash

declare -a nums=()

IFS=','

read -r input

n=0
for i in $input
do
    nums+=("$i")
    ((n++))
done

for ((i = 0; i<n; i++))
do
    for ((j = 0; j<n-i-1; j++))
    do
        if [ "${nums[j]}" -gt "${nums[$((j+1))]}" ]
        then
            temp=${nums[j]}
            nums[$j]=${nums[$((j+1))]}  
            nums[$((j+1))]=$temp
        fi
    done
done

echo "$(IFS=, ; echo "${nums[*]}")"