#!/bin/sh

accession=$(zenity --entry --title="Transfer Information" --text="What is the accession number?")

if [ ! -d "/home/bcadmin/Desktop/pending_transfers/$accession" ]; then
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession
fi

unique_id=$(zenity --entry --title="Transfer Information" --text="What is the unique identifier?")

if [ -d "/home/bcadmin/Desktop/pending_transfers/$accession/$unique_id" ]; then
  zenity --info --title="Error" text="Folder already exists!"
  exit
else
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id
fi

mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id/metadata

zenity --info --title="Folder Created" text="The folders has been created for $accession/$unique_id"

#create disk image

image_date=$(date +"%Y-%m-%d-%T")

sudo dd if=/dev/sdb of=/home/bcadmin/Desktop/pending_transfers/$accession/$unique_id/$unique_id.img
