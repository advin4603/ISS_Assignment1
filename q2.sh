#!/bin/bash

sed -r "s/^(.*) ~(.*)$/\2 once said, \"\1\"/" quotes.txt > speech.txt