#!/bin/sh

accession=$(zenity --entry --title="Transfer Information" --text="What is the accession number?")

if [ ! -d "/home/bcadmin/Desktop/pending_transfers/$accession" ]; then
	mkdir /home/bcadmin/Desktop/pending_transfers/$accession
fi

unique_id=$(zenity --entry --title="Transfer Information" --text="What is the unique identifier?")

unique_folder=${accession}_${unique_id}

if [ -d "/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder" ]; then
	zenity --info --title="Error" text="Folder already exists!"
	exit
else
	mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder
fi

real_folder=$(zenity --list --title="Processing Information" --text="Was this item removed from a folder?" --radiolist --column "" --column "Answer" FALSE "Yes" FALSE "No")

mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/media_photographs

if [ $real_folder = "Yes" ]; then
	collection_id=$(zenity --entry --title="Collection ID" --text="What is the Collection ID?")
	cp /home/bcadmin/Desktop/spco_scripts/resources/SPCO-Libraries-Logo.png /home/bcadmin/Desktop/spco_scripts/resources/2018-10-11_media_removal.html /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/media_photographs
	python3 /home/bcadmin/Desktop/spco_scripts/create_html.py $accession $unique_folder $collection_id
fi 

python3 /home/bcadmin/Desktop/spco_scripts/move_photos.py $accession $unique_folder

python3 /home/bcadmin/Desktop/spco_scripts/html2pdf.py /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/media_photographs/2018-10-11_media_removal.html

#email

zenity --info --title="Folder Created" --text="The folders has been created for $accession/$unique_id"

rm -f /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/media_photographs/2018-10-11_media_removal.html
rm -f /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/media_photographs/SPCO-Libraries-Logo.png



