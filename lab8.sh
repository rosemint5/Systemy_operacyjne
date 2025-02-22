#!/bin/bash

#zadanie 8.0
z1() {
  sourceFile=$1
  outputFirst=$2
  outputSecond=$3
  
  if [ $# -lt 3 ]; then 
    echo "Function must get at least 3 arguments" 
    exit -1 
  fi 
 
 
#sprawdzanie praw pliku zrodlowego
  if [ ! -r $sourceFile ]; then 
    echo "You dont have rights to read the source file" 
    exit -1 
  fi 
  
	
   
#sprawdzanie czy pliki isntnieja oraz praw na zapisywanie
  if [ ! -e $outputFirst ]; then 
    touch "$outputFirst" 
  else 
    read -p "File $outputFirst exists. Do you want to delete it? (y/n)" answer 
    if [ "$answer" = "y" ]; then 
      > "$outputFirst" #wyczyszczenie zawartosci pliku 
    fi  
  fi 
  
  if [ -e $outputFirst ] && [ ! -w $outputFirst ]; then 
    echo "You dont have rights to save output file #1" 
    exit -1 
  fi 
  
  if [ ! -e $outputSecond ]; then 
    touch "$outputSecond" 
  else 
    read -p "File $outputFirst exists. Do you want to delete it? (y/n)" answer 
    if [ "$answer" = "y" ]; then 
      > "$outputSecond" #wyczyszczenie zawartosci pliku 
    fi  
  fi
    
  if [ -e $outputSecond ] && [ ! -w $outputSecond ]; then  
    echo "You dont have rights to save output file #2" 
    exit -1 
  fi 
  
#zapisywanie kazdej linijki plika zrodlowego w docelowe w sposob randomowy   
  while IFS= read -r line; do #Odczytywanie kazdej linii wejsciowej  
   random=$((RANDOM % 2)) #Generowanie liczby losowej (0 lub 1) 
    if [ $random -eq 0 ]; then #przydzielenie do jakiego z dwoch plikow trafi linia 
      echo $line >> "$outputFirst" 
    else 
      echo $line >> "$outputSecond" 
    fi 
   done < "$sourceFile" #czytanie poszczegolnej linii kodu  
   
 echo "Lines has been saved randomly in two output files"
   
   

}

sourceFile="/home/blinchikubuntu/Desktop/source.txt"
outputFirst="/home/blinchikubuntu/Desktop/output1.txt"
outputSecond="/home/blinchikubuntu/Desktop/output2.txt"

z1 $sourceFile $outputFirst $outputSecond



#zadanie 8.1

createDirectoryStructure()
{
    baseDirectoryPath=$1
    filePath=$2
    
#sprawdzanie czy jest podany katalog oraz praw
    if [ ! -d "$baseDirectoryPath" ]; then
        echo "Given path does not exist or leading not to the directory"
    fi

    if [ ! -w "$baseDirectoryPath" ]; then
        echo "You dont have rights to save given directory"
    fi


    if [ ! -r "$filePath" ]; then
        echo "You dont have right to read given file"
    fi

#iterowanie po linijkach pliku oraz tworzenie katalogow i plikow w nich
    while IFS= read -r directoryName; do
        mkdir -p "$baseDirectoryPath/$directoryName" 
        cd "$baseDirectoryPath/$directoryName" || exit  

        for ((i = 0; i < 10; i++)); do
            touch "F$i"
        done

        #cd "$OLDPWD" || exit
    done < "$filePath"
    
    echo "Directories oraz files has been created and saved"
}

baseDirectoryPath="/home/blinchikubuntu/Desktop/baseDirectory"
filePath="/home/blinchikubuntu/Desktop/listDirectories.txt"


createDirectoryStructure $baseDirectoryPath $filePath




