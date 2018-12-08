#!/bin/sh

echo -n "What is the accession number?"
read accession

if [ ! -d "/home/bcadmin/Desktop/pending_transfers/$accession" ]; then
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession
fi

echo -n "What is the unique identifier?"
read unique_id

unique_folder=${accession}_${unique_id}

if [ -d "/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder" ]; then
  zenity --info --title="Error" text="Folder already exists!"
  exit
else
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder
fi

image_file=/home/

dd if=/dev/sdb of=$/home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_folder.img

echo "Image has been complete.  Please extract the 'img' disk image with the tool"
