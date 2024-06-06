#!/bin/bash

validint()
{
    number=$1; min=$2; max=$3

    if [ "${number%${number#?}}" = "-" ] ; then
      echo "enter a value without sign."
      return 1
    fi

    nodigit="$(echo $number | sed 's/[[:digit:]]//g')"
    if [ $nodigit = "." ] ; then
      echo "enter non-decimal value."
      return 1
    fi

    if [ $number -lt $min ] ; then
      echo "less than."
      return 1
    fi

    if [ $number -gt $max ] ; then
      echo "greater than."
      return 1
    fi

}

if validint $1 $2 $3 ; then
  echo "value is valid int."
fi