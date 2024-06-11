#!/bin/bash

scale=2

show_help()
{
cat << EOF
  a+b plus
  a-b minus
  a*c times
EOF
}

if [ $# != 0 ] ; then
  scriptbc "$@"
fi

echo -n "calc >"

while read command argument
do
  case $command in 
    quit|exit) exit 0 ;;
    scale) scale=$command ;;
    help|\?) show_help ;;
    *) scriptbc -p "$scale" "$command" "$argument" ;;
  esac
  echo -n "calc >"
done
echo ""

exit 0