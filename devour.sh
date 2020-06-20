#!/usr/bin/env sh

id=$(xdo id)
xdo hide
sh -c "$*" >/dev/null 2>&1
xdo show "$id"
