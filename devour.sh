#!/usr/bin/env sh

SCRIPT=/tmp/script
WID=$(xdo id)
SHELL=$(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd)

cat << eof > $SCRIPT
xdo hide
$@ > /dev/null 2>&1
xdo show "$WID"
eof

$SHELL -i $SCRIPT
