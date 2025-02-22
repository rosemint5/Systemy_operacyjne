#!/bin/bash

filePath="$1"


#zadanie1
echo 
grep -oP '(?<=\s|^)(?<!\+|\-)0x[a-fA-F0-9]+(?=\s|$)' "$filePath"
echo 
#zadanie 2
echo
grep -oP '(?<=\s|^)[a-zA-Z0-9.,;:]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+(?=\s|$)' "$filePath"
echo
#zadanie 3
echo
grep -oP '(?<=\s|^)[\+\-]*[0-9]*\.[0-9]+(?=\s|$)' "$filePath"
