# KDE Plasma Wallpaper Day/Night Cycler
This is a small repo that allows users to change their wallpaper in Plasma based on the time of day. Each hour, the wallpaper is changed to the most appropriate wallpaper for the time of day. Each day at 12:00am, the wallpaper set is changed.

## Installation
* On Arch: you can install `kde5-wallpaper-daynight-git` from the AUR
* On other distros: run INSTALL.sh

## Configuration
* Optionally copy `daynightrc_example` to `~/.config/daynightrc` and modify accordingly
	* `KDE` - Defaults to KDE, change to 1 to change wallpaper on Gnome
    * `WALLPAPER_PATH` - The folder containing all your wallpapers
	* `WALLPAPERS` - An array of wallpaper names (See [Example: Auto-cycling Wallpapers](#example-auto-cycling-wallpapers))
	* `WALLPAPER_EXTENSION` - The extension of your wallpapers (E.g. `jpg`, `png`)
	* `DAY_HOUR` - The hour to switch to day mode
	* `SUNSET_HOUR` - The hour to switch to sunset mode
	* `NIGHT_HOUR` - The hour to switch to night mode
* To hourly set the wallpaper based on time of day, do either of the following:
    * ### Systemd:

    Copy `daynight@.service` and `daynight@.timer` into `/etc/systemd/system/`. Then enable the timer with `systemctl enable daynight@YOURNAME.timer; systemctl start daynight@YOURNAME.timer`, replacing YOURNAME with your user.
    * ### Cron:

    Add `0 * * * * /home/resin/.local/bin/wallpaper --auto -u {YOURNAME}` to your crontab with `crontab -e`, replacing {YOURNAME} with your user.

Because this is just a pet project, other naming conventions or wallpapers each with different extensions aren't supported yet.
## Usage
* `wallpaper` / `wallpaper auto` - Automatically sets the wallpaper based on the date and time.
* `wallpaper --{day|night|sunset}` - Automatically sets the wallpaper based on the date, but manually sets the wallpaper to day/night/sunset variant.
* `wallpaper {image-path}` - Manually sets the wallpaper to a specified image.
* `-u | --user {username}` - Manually specify the user

## Example: Auto-cycling Wallpapers
Say you have 6 images in `/home/you/Pictures/` like so:
* tokyo-street-day.jpg
* tokyo-street-sunset.jpg
* tokyo-street-night.jpg
* old-house-day.jpg
* old-house-sunset.jpg
* old-house-night.jpg

You would set your `daynightrc` like so:
```
# Full path to image to use
WALLPAPER_PATH="/home/you/Pictures/"

# Array of wallpaper sets
# Each item is a name for set of wallpapers
WALLPAPERS=("tokyo-street" "old-house")

# Extension for set of wallpapers (E.g. jpg)
WALLPAPER_EXTENSION="jpg"

# Hours to switch the wallpaper at (24hr, e.g. 17 for 5pm)
DAY_HOUR=6
SUNSET_HOUR=17
NIGHT_HOUR=19
```
Every day at 12:00am, the script would alternate between tokyo-street and old-house, and every hour, it will decide whether to use the day, sunset or night variant of whichever of the two is being used that day.
