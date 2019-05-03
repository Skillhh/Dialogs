#!/bin/bash

# Step #1: Difine varibles 

EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m]'
STD='\033[0;0;39m]'

# Step #2: User defined function

pause(){
	read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	echo "one() called"
		pause
}
two(){
	echo "two() called"
		pause
}
show_menus(){
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "      MAIN- MENU        "
	echo "~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Set Terminal"
	echo "2. Reset Terminal"
	echo "3. Exit"
}
read_options(){
	local choice
	read -p "Enter choice [ 1 - 3 ] " choice 
	case $choice in
		1) one ;;
		2) two ;;
		3) exit 0;;
		*) echo -e "${RED} Error... ${STD} " && sleep 2
	esac

}
trap '' SIGINT SIGQUIT SIGTSTP

while true
do
	
	show_menus
	read_options

done
