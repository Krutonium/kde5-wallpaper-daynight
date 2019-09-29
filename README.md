# KDE Plasma Wallpaper Day/Night Cycler (WIP)
This is a small repo that allows users to change their wallpaper in Plasma based on the time of day. Each hour, the wallpaper is changed to the most appropriate wallpaper for the time of day. Each day at 12:00am, the wallpaper set is changed.

Say you have 6 images like so:
* tokyo-street-day.jpg
* tokyo-street-sunset.jpg
* tokyo-street-night.jpg
* old-house-day.jpg
* old-house-sunset.jpg
* old-house-night.jpg

Every day at 12:00am, the script will alternate between tokyo-street and old-house, and every hour, it will decide whether to use the day, sunset or night variant of whichever of the two is being used that day.

The settings containing the wallpapers and times of day to switch to day, sunset or night should be added to `~/.daynightrc`
