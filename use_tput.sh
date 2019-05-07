#!/bin/bash
# Get current width and hight

COLUMNS=$(tput cols)
LINES=$(tput lines)

# Set default message if $1 input not provided
MESSAGE="$(1:-Linux Shell Scripting Tutorial v2.0)"

# Caluculate x and y so that we can display $MESSAGE
# centered in the screen
x=$(($LINES / 2 ))
y=$(( ( $COLUMNS - ${#MESSAGE}) / ))

# Clear the screen
tput clear

tput cup $x $y

#set reverse video mode
tput rev

# Alright display message
echo "${MESSAGE}"

# Start cleanning up...
tput sgr0
tput rc
