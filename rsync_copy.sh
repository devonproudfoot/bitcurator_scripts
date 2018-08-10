#!/bin/sh

cd ../..

device=$(zenity --list --text="What type of media is being copied?" --radiolist --column "Check" --column "Device" TRUE "USB Drive")

if [  $device = "USB Drive" ]; then
  source=$/media/sdb1
fi

accession=$(zenity --entry --title="Transfer Information" --text="What is the accession number?")
unique_id=$(zenity --entry --title="Transfer Information" --text="What is the unique identifier?")

output=$/media/sf_BC_share/transfers/$accession/$unique_id

rsync -avz $source $output

zenity --info --title="Done!" text="Content has been copied!"
