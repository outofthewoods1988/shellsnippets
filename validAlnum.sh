#!/bin/bash

validAlphaNum()
{
    validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

    if [ "$1" = "$validchars" ] ; then 
      return 0 
    else
      return 1
    fi
}

/bin/echo -n "Enter input: "
read input 

if ! validAlphaNum "$input" ; then 
  echo "please enter only digit and letters." >&2
  exit 1
else
  echo "input is valid."
fi 

exit 0