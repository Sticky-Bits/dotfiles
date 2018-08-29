#!/bin/sh
#

screenshot() {
	case $1 in
	full)
		sleep 1
		scrot -s ~/Pictures/screenshots/$(date +"%Y_%m_%d_%T")_screenshot.png
		;;
	window)
		import ~/Pictures/screenshots/$(date +"%Y_%m_%d_%T")_screenshot.png
		;;
	*)
		;;
	esac;
}

screenshot $1
