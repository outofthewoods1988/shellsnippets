#!/bin/bash 

in_path() {
  cmd=$1  path=$2 result=1
  oldIFS=$IFS IFS=":"

  for directory in "$path" 
  do 
    if [ -x $directory/$cmd ] ; then 
      result=0
    fi 
  done 

  IFS=$oldIFS
  return $result 
}

checkForCmdInPath() {
  var=$1
  if [ $var != "" ] ; then 
    if [ ${var:0:1} = "/" ] ; then 
      if [ ! -x $var ] ; then 
        result=1
      fi 
    elif ! in_path $var "$PATH" ; then 
      return 2
    fi 
  fi  
}

if [ $# -ne 1 ] ; then 
  echo "Usage: $0 Command" >&2 
  exit 1
fi 

checkForCmdInPath $1 
case $? in 
  0 ) echo "$1 found in path" ;;
  1 ) echo "$1 not found or not executable" ;;
  2 ) echo "not executable" ;;
esac 
exit 0 