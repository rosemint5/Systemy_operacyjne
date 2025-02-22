#!/bin/bash

#sprawdzanie dysków
available_disks=$(lsblk -o NAME,SIZE,TYPE | grep disk)

#sprawdzanie partycji utworzonej podczas laboratorium
part="/dev/vdb1"
size=$(df -h | grep "$part")

#Nazwa pliku i ściezka końcowa
date_and_time=$(date +"%Y%m%d-%H%M%S")
final_name="Report_${date_and_time}.txt"
final_file_path="./${final_name}"

#Zapisanie do pliku
{
  echo "Dostępne dyski: "
  echo "$available_disks"
  echo
  echo "Dostępne miejsce na partycji $part: "
  echo "$size"
  echo
} > "$final_file_path"

#Komunikat końcowy
echo "Plik o nazwie $final_name został zapisany w $(pwd)."
