#!/bin/bash

. scriptbc.sh

c=$1
readablesize()
{
  if [ $1 -ge 1048576 ] ; then
    echo "$( scriptbc.sh -p 2 $1 / 1048576 )GB"
  elif [ $1 -ge 1024 ] ; then
    echo "$( scriptbc.sh -p 2 $1 / 1024 )MB"
  else
    echo "${1}KB"
  fi
}

a=$(readablesize $c)
echo $