#!/bin/bash

echo -n "Please enter the collection ID (no spaces): "
read coll_ID

while true; do
	echo -n "Would you like to create a SIP (y/n) "
	read choice
	if [ "$choice" == 'n' ]
    then
        exit 1
	fi
	echo -n "Please enter the series and item name (ex. 'Photographs--Basketball'): "
	read SIP
	mkdir /Users/proudfootd/Desktop/born-digital_working/$coll_ID--$SIP /Users/proudfootd/Desktop/born-digital_working/$coll_ID--$SIP/objects
	#mkdir /home/bcadmin/Desktop/working/$coll_ID--$SIP /home/bcadmin/Desktop/working/$coll_ID--$SIP/objects
    touch /Users/proudfootd/Desktop/born-digital_working/$coll_ID--$SIP.txt
	#touch /home/bcadmin/Desktop/working/$coll_ID--$SIP.txt
    open /Users/proudfootd/Desktop/born-digital_working/$coll_ID--$SIP.txt
    #open /home/bcadmin/Desktop/working/$coll_ID--$SIP.txt
    read -p "The text file has been opened, please copy the paths to the records to be included in the SIP.  Each folder or file should be be on a new line.  Hit enter when the file has been saved."
    while IFS='' read -r line || [[ -n "$line" ]]; do
        echo $line
        rsync -avc --progress "$line" /Users/proudfootd/Desktop/born-digital_working/$coll_ID--$SIP/objects
    done < "/Users/proudfootd/Desktop/born-digital_working/$coll_ID--$SIP.txt"
done
