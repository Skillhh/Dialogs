#!/bin/bash
# dynbox.sh - Yes / No box demo

dialog --title "Delete file" --backtitle "Linux Shell Script Tutorial Example" --yesno " Are you sure you want to permanently delete \" /tmp/foot.txt\"?" 7 60

response=$?

case $response in
	#0) echo "File deleted."
	0) dialog --title "Estado" --msgbox "File deleted" 7 60 ;;
	#1) echo "File not deleted. " ;;
	1) dialog --title "Estado" --msgbox "FIle not deleted." 7 60 ;;
	#255) echo "[ ESC ] key pressed. " ;;
	255) dialog --title "Salir" --msgbox "[ ESC ] key pressed." 7 60;;
esac
