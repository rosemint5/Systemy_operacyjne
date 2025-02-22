#!/bin/bash
#Zadanie 1.1
mkdir $1
#Zadanie 1.2
cd $1
#Zadanie 1.3
mkdir d1
mkdir d1/d1.1

mkdir d2
mkdir d2/d2.1
mkdir d3
mkdir d3/d3.1
mkdir d3/d3.2
mkdir Aa Bb Cc
touch d1/t1.txt
touch d2/d2.1/f1.csv
touch d3/d3.2/f2.csv
#Zadanie 1.4
mv d1/t1.txt d1/d1.1/t1.txt 
#Zadanie 1.5
cp d2/d2.1/f1.csv d1/f1.csv
#Zadanie 1.6
mv Aa Aa1
#Zadanie 1.7
ls *1/ *2
#Zadanie 1.8
du --max-depth=1
