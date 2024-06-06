#!/bin/bash

nicenumber()
{
    integer=$(echo "$1" | cut -d. -f1)
    decimal=$(echo "$1" | cut -d. -f2)

    if [ "$decimal" != "$1" ] ; then
      result="${DD:= .}$decimal"
    fi

    thousands=$integer
    while [ "$thousands" -gt 999 ] ; do
      remainder=$(($thousands%1000))
      while [ ${#remainder} -lt 3 ] ; do
        remainder="0$remainder"
      done
      result="${TD:= ,}$remainder$result"
      thousands=$(($thousands/1000))
    done

    nicenum="$thousands$result"
    if [ ! -z "$2" ] ; then
      echo "$nicenum"
    fi
}

DD="."
TD=","

while getopts "d:t:" opt ; do
  case $opt in
    d ) DD=$OPTARG ;;
    t ) TD=$OPTARG ;;
    * ) echo "wrong input" ;;
  esac
done
shift $(($OPTIND - 1))

if [ $# -eq 0 ] ; then
  echo "Usage: "
fi

nicenumber $1 1

exit 0
