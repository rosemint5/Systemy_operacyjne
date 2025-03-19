#!/bin/bash

time=$(date +"%d-%m-%Y %H:%M:%S")

file="system_info.txt"

echo -e "\n***********************************************************************\n" >> "$file"

echo -e "Raport $time\n" >> "$file"

echo "Pamięć RAM:" >> "$file"

grep MemTotal /proc/meminfo >> "$file"

echo -e "\nWykorzystanie dysku:" >> "$file"

df -h >> "$file"

echo -e "\nNazwa hosta:" >> "$file"

hostnamectl --static >> "$file"

echo -e "\nSystem operacyjny:" >> "$file"

hostnamectl | sed -n 's/^Operating System: //p' >> "$file"

echo "Informacje zapisane w pliku system_info.txt"
