#!/bin/sh
#
# Hides your terminal window before launching an external program and unhides it after quitting.
# Dependencies: sed, xdo
# Usage: devour CMD/ALIAS ... SAFE FILE ...
#        devour CMD/ALIAS ... -- SAFE FILE/UNSAFE FILE

ARGS=$*
CMD="${ARGS%% -- *}"
FILE="${ARGS##* -- }"
[ "$CMD" != "$FILE" ] && SAFEFILE=$(echo "$FILE" | sed 's/ /\\ /g')
WID=$(xdo id)

xdo hide
$SHELL -i -c "$* > /dev/null 2>&1; exit"
xdo show "$WID"
