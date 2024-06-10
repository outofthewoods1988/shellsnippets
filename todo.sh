#!/bin/bash

scriptbc=$(which scriptebc)

readablesize()
{
  if [ $1 -ge 1048576 ] ; then
    echo "$( scriptbc -p 2 $1 / 1048576 )GB"
  elif [ $1 -ge 1024 ] ; then
    echo "$( scriptbc -p 2 $1 / 1024 )MB"
  else
    echo "${1}KB"
  fi
}

readablesize $1
