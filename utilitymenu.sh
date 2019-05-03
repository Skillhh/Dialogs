#!/bin/bash
# utilititymenu.sh - A sample shell script to display menu on screen
# Store menu options seleted by the user

INPUT=/tmp/menu.sh.$$

# Storage file for display cal and date command output
OUTPUT=/tmp/output.sh.$$

# get text editor or fall back to vi_editor
vi_editor=${EDITOR-vi}

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

# 
# Purpose - display output using magbox
# $1 -> set msgbox height
# $2 -> set msgbox widht
# $3 -> set msgbox title
#
function display_output(){
	local h=${1-10}				# box height default 10 
	local w=${2-41}				# box width default 41
	local t=${3-Output}			# box title
	dialog --backtitle "Linux Shell Script Tutorial" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}
#
# Purpose - display current system date & time
#
function show_date(){
	echo "Today is $(date) @ $(hostname -f)." >$OUTPUT
	display_output 6 60 "Date and Time"
}
#
# Purpose - display a calendar 
#
function show_calendar(){
	cal >$OUTPUT
	display_output 13 25 "Calendar"
}
#
# set infinite loop
#
while true
do
### Display main menu ###
	dialog --clear --help-button --backtitle "Linux Shell Script Tutorial"\
	--title "[ MAIN - MENU ]" \
	--menu "You can use he UP/DOWN arrow keys, the first \n\
	letter of the  choice as a hot key, or the \n\
	number key 1-9 to choose an option.\n\
	Choose the TASK" 15 50 4 \
	Date/time "Displays date and time" \
	Calendar "Displays a calendar"\
	Editor "Start a text editor"\
	Exit "Exit to shell" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")

	# make decision

	case $menuitem in
		Date/time) 
			show_date
		;;
		Calendar) 
			show_calendar
		;;
		Editor) 
			$vi_editor
		;;
		Exit)
			dialog --title "Mensaje" --clear --msgbox "Bye" 10 25
			clear
			break
		;;
	esac

done

#if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT

