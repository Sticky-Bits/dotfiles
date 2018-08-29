#!/bin/bash

wallpaper_directory=~/Pictures/wallpapers/delaunay/
change_time=5m

cd $wallpaper_directory
while true; do
	files=()
	for i in *.svg; do
		[[ -f $i ]] && files+=("$i")
	done
	range=${#files[@]}

	((range)) && feh --bg-fill --magick-timeout 1 "${files[RANDOM % range]}"

	sleep $change_time
done
