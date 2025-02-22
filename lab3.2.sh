#!/bin/bash

filePath="$1"
keyWord="$2"

#Z3.0.1
file -i "$filePath"

#Z3.0.2
wc -l "$filePath" #liczba linijek

#Z3.0.3
wc -m "$filePath" #liczba znakow

#Z3.0.4
du -h "$filePath" #czytelny rozmiar pliku

#Z3.0.5
grep -c "$keyWord" "$filePath"

#Z3.0.6
grep -vc "$keyWord" "$filePath" #-v dla odwrocenia

#Z3.0.7
cat "$filePath" | head -n 5 | tail -n 1 
