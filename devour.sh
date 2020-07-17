#!/bin/sh
#
# Hides your terminal window before launching an external program and unhides it after quitting.

WID=$(xdo id)

$SHELL -i -c "xdo hide
$* > /dev/null 2>&1
xdo show $WID"
