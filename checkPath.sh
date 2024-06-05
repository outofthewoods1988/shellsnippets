#!/bin/bash 

if [ $# -ne 1 ] ; then 
  echo "Usage: $0 Command" >&2 
  exit 1
fi 

checkForCmdInPath $1 
case $? in 
  0 ) echo "$1 found in path" ;;
  1 ) echo "$1 not found" ;;
  2 ) echo "not found or not executable" ;;
esac 
exit 0 