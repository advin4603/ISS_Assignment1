#!/bin/bash

# a) remove empty lines.
lines=$(sed "/^$/d" quotes.txt)

# b) remove duplicates.
echo "$lines" | awk '!lineCntr[$0]++'