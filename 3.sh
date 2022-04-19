#!/bin/bash

if [ $# != 1 ]
then
    echo "No file provided."
    exit
fi

stat --printf="%s\n" "$1"

wc -l < "$1"

wc -w < "$1"

i=1
while IFS= read -r line; do
    echo "Line No: $i - Count of Words: $(echo "$line" | wc -w)"
    ((i=i+1))
done < "$1"

words=$(grep -o -E '\w+' "$1" | awk '!lineCntr[$0]++')
for word in $words
do
    freq=$(grep -o "$word" "$1" | wc -l)
    if [ "$freq" -gt 1 ]
    then
        echo "Word: $word - Count of repetition: $freq"
    fi
done