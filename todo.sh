#!/bin/bash

validint()
{
    number="$1"; min="$2"; max="$3"

    if [ -z $number ] ; then
      echo "enter a number"
      return 1
    fi

    if [ "${number%${number#?}}" = "-" ] ; then
      testvalue="${number#?}"
    else
      testvalue="$number"
    fi

    nodigit="$(echo $number | sed 's/[[:digit:]]//g')"

    if [ ! -z $nodigit ] ; then
      echo "enter value without decimal"
      return 1
    fi

    if [ $number -lt $min ] ; then
      echo "less than min"
      return 1
    fi

    if [ $number -gt $max ] ; then
      echo "greater than max"
      return 1
    fi

}

if validint $1 $2 $3 ; then
  echo "enter valid value"
fi
