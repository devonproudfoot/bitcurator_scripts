#!/bin/bash

echo -n "What is the four digit ID number of the Disk Image? "
read ID

echo -n "Drag the new filepath to deposit the files: "
read path

cd /media/$ID/
zip $path/$ID.zip *

cd $path
unzip $ID.zip
rm $ID.zip
