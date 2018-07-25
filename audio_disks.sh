#!/bin/sh

# Check if an accession folder exists, if not, create one
accession=$(zenity --entry --title="Transfer Information" --text="What is the accession number?")

if [ ! -d "/home/bcadmin/Desktop/pending_transfers/$accession" ]; then
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession
fi

# Check if a folder for the media exists, if not, create one
unique_id=$(zenity --entry --title="Transfer Information" --text="What is the unique identifier?")

if [ -d "/home/bcadmin/Desktop/pending_transfers/$accession/$unique_id" ]; then
  zenity --info --title="Error" text="Folder already exists!"
  exit
else
  mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id
fi

# Creating copy

image_date=$(date +"%Y-%m-%d-%T")

cdrdao read-cd --datafile $unique_id.bin $unique_id.toc

mv $unique_id.bin /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id
mv $unique_id.toc /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id

toc2cue /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id/$unique_id.toc /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id/$unique_id.cue

cd /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id

bchunk -v -w $unique_id.bin $unique_id.cue $unique_id

# Creating metadata file
# NOT LOOPING THROUGH THE DIRECTORY

$image_date >> $metadata_file

metadata_file="$unique_id.txt"
for filename in "/home/bcadmin/Desktop/pending_transfers/$accession/$unique_id/"
do
  if [[ -f "$filename"]]; then
    md5sum $filename >> $metadata_file
  fi
done

mkdir /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id/metadata
mv $metadata_file /home/bcadmin/Desktop/pending_transfers/$accession/$unique_id/metadata
