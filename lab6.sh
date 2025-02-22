#!/bin/bash

#zadanie 6.0

division()
{
  if ! [[ $(($1 - $2)) == 0 ]]; then
    echo "($1 + $2)/($1 - $2) = " $((($1 + $2)/($1 - $2)))
  else  
    echo "cant divide by 0!"
    exit -1
  fi  
}

echo "Enter first and second number for the (a + b)/(a - b)"
read -p "First number: " firstNum
read -p "Second number: " secondNum
echo $(division $firstNum $secondNum)
echo " "

#zadanie 6.1

factorial() 
  {
    if  [[ ("$1" =~ ^[1-9]+[0-9]*$) ]] || [[ ($1 -eq 0) ]]; then

      if [[ $1 -eq 0 ]] || [[ $1 -eq 1 ]]; then
        echo 1
      else
        local subFactorial
        subFactorial=$(factorial $(($1 - 1)))
        echo $(($1 * $subFactorial))
      fi
  
    else  
      echo "Number is not appropriate."
      exit -1;
    fi
  }
  
read -p "Enter the number for the n!(recursive): " thirdNum
echo "Your result: " $(factorial $thirdNum)
echo " "

#zadanie 6.2

factorialIter()
  { 
    if [[ ("$1" =~ ^[1-9]+[0-9]*$) ]] || [[ ($1 -eq 0) ]]; then
      if [[ $1 -eq 0 ]] || [[ $1 -eq 1 ]]; then
        echo 1
      else
        local resultFactorialIter=1

        for((i = 2; i <= $1; i++)); do
          resultFactorialIter=$((resultFactorialIter * i))
        done
        echo $resultFactorialIter
      fi
      else
          echo "Number is not appropriate."
          exit -1;
    fi
  }

read -p "Enter the number for the n!(iterable): " fourthNum
echo "Your result:" $(factorialIter $fourthNum)
echo " "

#zadanie 6.3

sumOfAll()
  {
    local sum=0
      for arg in "$@"; do
        if [[ "$arg" =~ ^[+-]*[1-9]+[0-9]*$ ]]; then
          sum=$((sum + arg))
        else
          echo "Attention: argument '$arg' is not an integer"
        fi
      done
      echo "Sum of given integers: $sum"
  }
  
read -p "Type in integers separated by space: " -a inputArray
echo $(sumOfAll "${inputArray[@]}")
  





