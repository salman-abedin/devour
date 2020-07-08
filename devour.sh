#!/usr/bin/env sh

SCRIPT=/tmp/script
WID=$(xdo id)
SHELL=/tmp/shell

[ -e $SHELL ] ||
    awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd |
    tee $SHELL

cat << eof > $SCRIPT
xdo hide
$@ > /dev/null 2>&1
xdo show "$WID"
exit 0
eof

$(cat $SHELL) -i $SCRIPT
