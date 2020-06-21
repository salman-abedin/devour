#!/usr/bin/env sh

id=$(xdo id)
xdo hide
whitespace="[[:space:]]"
args=()
for i in "$@"
do
    if [[ $i =~ $whitespace ]]
    then
        i=\'$i\'
    fi
   args+="$i " 
done

sh -c "$args" >/dev/null 2>&1

xdo show "$id"
