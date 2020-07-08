#!/usr/bin/env sh

SHELL=/tmp/shell
SCRIPT=/tmp/script
WID=$(xdo id)

[ -e $SHELL ] ||
    awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd > $SHELL

cat << eof > $SCRIPT
xdo hide
$@ > /dev/null 2>&1
xdo show "$WID"
exit 0
eof

$(cat $SHELL) -i $SCRIPT
