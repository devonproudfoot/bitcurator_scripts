#!/bin/sh

# Check if an accession folder exists, if not, create one
accession=$(zenity --entry --title="Transfer Information" --text="What is the accession number?")

if [ ! -d "/home/bcadmin/Desktop/pending_transfers/$accession" ]; then
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession
fi

# Check if a folder for the media exists, if not, create one
unique_id=$(zenity --entry --title="Transfer Information" --text="What is the unique identifier?")

unique_folder=${accession}_${unique_id}

if [ -d "/home/bcadmin/Desktop/pending_transfers/$accession/$uniqe_folder" ]; then
  zenity --info --title="Error" text="Folder already exists!"
  exit
else
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder
fi

# Creating copy

# image_date=$(date +"%Y-%m-%d-%T")

cdrdao read-cd --datafile $unique_id.bin $unique_id.toc

mv $unique_id.bin /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder
mv $unique_id.toc /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder

toc2cue /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_id.toc /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/$unique_id.cue

cd /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder

bchunk -v -w $unique_id.bin $unique_id.cue $unique_id

# Creating metadata file

# photo=$here

mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/media_photographs
# mv $photo /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/metadata

clamscan -i /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder

echo "Complete! Please close this window"
