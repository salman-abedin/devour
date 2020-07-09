#!/usr/bin/env sh

SCRIPT=/tmp/script
WID=$(xdo id)

cat << eof > $SCRIPT
xdo hide
$@ > /dev/null 2>&1
xdo show "$WID"
exit 0
eof

$SHELL -i $SCRIPT
