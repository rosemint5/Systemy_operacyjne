#!/bin/bash

#zadanie 9.0

statistics()
{
  sourceFile=$1
  statisticFile=$2
  
  
#sprawdzanie praw i istnienie pliku zrodlowego
  if [ ! -e "$sourceFile" ]; then
    echo "File $sourceFile does not exist."
    exit -1
    
  elif [ ! -r "$sourceFile" ]; then
    echo "You don't have permission to read $sourceFile"
    exit -1
  fi

#sprawdzanie praw i isntnienia pliku docelowego
  if [ ! -e "$statisticFile" ]; then
    touch "$statisticFile"
    if [ ! -w "$statisticFile" ]; then
      echo "You don't have permission to save $statisticFile"
      exit -1
    fi
  fi

  if ! touch "$statisticFile"; then
    echo "You don't have permission to create $statisticFile"
    exit -1
  fi
  
#tablica asosacyjna dla przeczowywania statystyki  
  declare -A statArray


#rozdzielenie slow, podliczanie ich wystepowania oraz zapis statystyki do pliku docelwoego
  while IFS= read -r line; do
    #cleanedLine=$(echo "$line" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' )
    #jezeli nie chcemy podliczac wystepowanie cyfr
    cleanedLine=$(echo "$line" | tr '[:upper:]'  '[:lower:]' | tr -d '[:punct:][:digit:]' ) 
    read -ra words <<< "$cleanedLine"

    for word in "${words[@]}"; do
      if [ -n "$word" ]; then
        ((statArray[$word]++))
      fi
    done
  done <"$sourceFile"

  for key in "${!statArray[@]}"; do
    echo "Word '$key' appends ${statArray[$key]} times"
  done | sort -rn -k4 > "$statisticFile"


}

sourceFile="/home/blinchikubuntu/Desktop/source.txt"
statisticFile="/home/blinchikubuntu/Desktop/statistics.txt"

statistics $sourceFile $statisticFile
