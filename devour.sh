#!/bin/sh

WID=$(xdo id)
SCRIPT="xdo hide
$* > /dev/null 2>&1
xdo show $WID"

$SHELL -i -c "$SCRIPT"
