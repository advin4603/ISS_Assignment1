#!/bin/bash

read -r input

rev=$(echo "$input" | rev)

echo "$rev"

result=""
for (( i=0; i<${#rev}; i++ )); do
  char="${rev:$i:1}"
  
  if [[ $char =~ [a-zA-Z] ]]
  then
    printf -v ord '%d' "'$char"
    ((ord++))
    printf -v fmt '\\x%x' "$ord"
    printf -v nextChar "$fmt"
    result+=$nextChar
  else
    result+=$char
  fi
  
done

echo "$result"

read -r input2
halfLen=$(((${#input2}/2)))
rev2=$(echo "${input2:0:$halfLen}" | rev)
result=$rev2
result+=${input2:$halfLen:$halfLen}
echo "$result"
