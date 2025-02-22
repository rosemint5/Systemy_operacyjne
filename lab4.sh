#!/bin/bash

searchDir="$1"
destDir="$2"

#1
mkdir -p "$destDir"

#2
find "$searchDir" -type f -name "*.txt"

#3
find "$searchDir" -type l

#4
find "$searchDir" -type f -perm /a=x -name "*.sh"

#5
find "$searchDir" -type d -name "[aAdD]"

#6
find "$searchDir" -type f -empty -user "user"

#7
find "$searchDir" -type f -group "user" -size +1M

#8
find "$searchDir" -type f -cmin -120

#9
find "$searchDir" -type d -perm /a=t

#10
find "$searchDir" -type f \( -perm /u=s -o -perm /g=s \)

#11
find /dev/ \( -type c -o -type b \)

#12
find "$searchDir" -type d -empty -exec rmdir {} \;

#13
find "$searchDir" -type f -size +100M -exec mv {} "$destDir" \;

#14
find "$searchDir" -type d -name "Z*" -exec cp -r {} "$destDir" \;
