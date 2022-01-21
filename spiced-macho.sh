#!/bin/sh
reader="brave --app=file://"
manual=$(apropos -s ${SECTION:-''} ${@:-.} | \
    grep -v -E '^.+ \(0\)' |\
    awk '{print $2 "    " $1}' | \
    sort -R | \
    rofi -dmenu -i -p "Man-Pages " -theme gruvbox-dark | \
    sed -E 's/^\((.+)\)/\1/')
open (){
man -Tpdf $manual > /home/$USER/Documents/Manuals/$utility_name.pdf  
$reader/home/$USER/Documents/Manuals/$utility_name.pdf
}
if [ ! -z "$manual" ]; then
utility_name="$(echo "$manual" | sed 's/[[:space:]]//g' | sed 's/./&-/1' )"
if [[ ! -d "/home/$USER/Documents/Manuals" ]]; then
mkdir /home/$USER/Documents/Manuals
open && exit
else
open && exit
fi
else
exit
fi

