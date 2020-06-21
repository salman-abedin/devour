#!/usr/bin/env sh

id=$(xdo id)
xdo hide
$("$@") > /dev/null 2>&1
xdo show "$id"
