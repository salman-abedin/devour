#!/bin/sh

WID=$(xdo id)

$SHELL -i -c "xdo hide
$* > /dev/null 2>&1
xdo show $WID"
