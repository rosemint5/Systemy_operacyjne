#!/bin/bash

#Z3.1.1
mkdir $1

#Z3.1.2
grep -w "$(whoami)" /etc/passwd #-w dla wyszukiwania konkretnie nazwy uzytkownika

#Z3.1.3
cut -d: -f 1,6,7 /etc/passwd | sort -r -t: -k 1,1 > $1/F1.csv

#Z3.1.4
cut -d: -f 7 /etc/passwd | rev | sort | rev | uniq > $1/F2.csv 

#Z3.1.5
cut -d: -f 1 /etc/passwd | tr 'a-z' 'A-Z' > $1/F3.txt

#Z3.1.6
grep -A 4 -B 4 "$(whoami)" /etc/passwd | grep -v "$(whoami)" > $1/F4.txt

#Z3.1.7
diff -y /etc/passwd $1/F4.txt > $1/differences.txt
