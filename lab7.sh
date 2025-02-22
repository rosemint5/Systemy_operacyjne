#!/bin/bash


#7.0
bubbleSort()

{
  # Przekazujemy do tej tablicy wszystkie argumenty przekazane do funkcji
  local array=("$@") 
  # Liczba elementow tablicy
  local n=${#array[@]} 
 
  # Sprawdzamy czy bezacy element jest mniejszy niz nastepny, jezeli tak to zamienami miejscami elementy
    for ((i=0; i<=$n; i++)); do
      for ((j=0; j<$((n-i-1)); j++)); do
        if (( ${array[j]} > ${array[j+1]} )); then 
          tmp=${array[j]}
          array[j]=${array[j+1]}
          array[j+1]=$tmp
	fi
      done
    done

  echo "Sorted data: ${array[@]}"  
}

read -p "Right down data you want to sort by 'Bubble sort': " -a inputArray
echo $(bubbleSort "${inputArray[@]}")

#7.1
createMultiplicationTable()
{
  local array=("$@")

  local rows=${array[0]}
  local columns=${array[1]}


  if [[ ${#array[@]} -ne 2 ]]; then
    echo "You must type in exactly TWO integers"
    exit 1
  fi
  
  if [ "$rows" -le 0 ] || [ "$columns" -le 0 ]; then
    echo "Integers must be positive"
    exit 1
  fi
  
    # Inicjalizacja dwuwymiarowej tablicy
    declare -A multiplicationTable=()
   
  for ((i=1;i <= rows;i++)); do
    for ((j=1;j <= columns;j++)); do
      multiplicationTable[$i, $j]=$((i * j))
    done
  done
  
  for ((i=1;i <= rows;i++)); do
    for ((j=1; j <= columns;j++)); do
      printf "%-4s" "${multiplicationTable[$i, $j]}"
    done
    echo
  done

    
}

read -p "Right down two integers separated by space to create multiplication table: " -a inputArray
createMultiplicationTable "${inputArray[@]}"

#7.2

numericIntegral()
{ 
  if [ $# -lt 2 ]; then 
    echo "Podaj co najmniej dwie liczby rzeczywiste do obliczenia calki." 
    exit -1 
  fi 
   
  local values=("$@") 
   
  local integral=0 
   
   for ((i=1;i<${#values[@]};i++)); do 
     dt=$(echo "scale=10; $i - $(($i - 1))" | bc) 
     
     trapArea=$(echo "scale=10; (${values[$i]} + ${values[$i - 1]}) * $dt / 2" | bc) 
     
     integral=$(echo "scale=10; ($integral + $trapArea)" | bc) 
   done 
    
   echo $integral 
    
} 
 
read -p "Right down data below seperated by space to calculate the integral " -a inputArray
 
numericIntegral ${inputArray[@]}



