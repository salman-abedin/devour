#!/usr/bin/env sh

echo "$*" | grep "\.ar\." && {
  devour alacritty \
    --config-file ~/.config/alacritty/alacritty_ar.yml \
    -e "$EDITOR" "$*" &
  exit
}

echo "$1" | grep "\.sent$" && {
   devour sent "$1" &
   exit
}

case $(file --mime-type "$*" -bL) in

  text/* | inode/x-empty | application/json | application/octet-stream)
    "$EDITOR" "$*"
    ;;

  video/*)
    pidof mpv || devour mpv "$*"
    ;;

  application/pdf | application/postscript)
    pidof zathura || devour zathura "$*"
    ;;

  image/gif)
    pgrep mpv || devour "mpv --loop" "$*"
    ;;

  image/*)
    pidof feh ||
      devour \
        "feh -A 'set-bg %f' -B 'black' -F -d --edit --keep-zoom-vp --start-at" "$*"
    ;;

esac
