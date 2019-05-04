#!/bin/bash
# filename: iso.py

counter=0

#ORG="/home/skill/Downloads/DAG.rar"
ORG="/dev/sr0"
DEST="/home/skill/open_suse.iso"

while :
do	
	(( counter+=1))

cat <<EOF
XXX
$counter
Copy file... ($counter%)
XXX
EOF
	
	dd if=${ORG} of=${DEST} &>/dev/null

#((counter+=0))
[ $counter -eq 100 ] && break

done | dialog --backtitle "Creando un archivo .ISO" --title "Copy File" --clear --gauge "Please wait" 10 70 0

dialog --backtitle "Creando un archivo .ISO" --title "Mensaje" --clear --msgbox "Terminado" 10 70
