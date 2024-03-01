#!/usr/bin/bash

while : ; do
				file="$(ls ~/Wallpaper/*.png | sort -R | tail -1)"
				swww img "$file" 
				sleep 600
done
