#!/bin/bash

czas=$(date +"%Y%m%d-%H%M%S")
plik="Report_${czas}.txt"
katalog="/home/mintr" sciezka="$katalog/$plik"
echo "Dostępne dyski:" > "$sciezka"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep disk >> "$sciezka"
echo -e "\nMiejsce na partycji /dev/sdb1:" >> "$sciezka"
df -h | grep "/dev/sdb1" >> "$sciezka"
echo "Plik o nazwie ${plik} został zapisany w ${sciezka}."