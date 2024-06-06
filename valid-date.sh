#!/bin/bash

monthNumToName()
{
    case $1 in 
      1 ) month="Jan" ;; 2 ) month="Feb" ;;
      * ) echo "unknown month value $1" >&2
      exit 1
    esac
    return 0
}

if [ $# -ne 3 ] ; then 
  echo "Usage: $0 month day year" >&2
  exit 1
fi

if [ $3 -le 99 ] ; then 
  echo "$0: expect a 4-digit value." >&2
  exit 1
fi

if [ -z $(echo $1 | sed 's/[[:digit:]]//g') ] ; then
  monthNumToName $1
else
  month="$(echo $1 | cut -c1 | tr '[:lower:]' '[:upper:]')"
  month="$(echo $1 | cut -c2-3 | tr '[:upper:]' '[:lower:]')"
fi

echo $month $2 $3

exit 0