#!/bin/sh

echo "Please enter the accession number: "
read accession

echo "Please enter the unique identifier: "
read unique_id

unique_folder=${accession}_${unique_id}

cd /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/
mkdir manualNormalization
cd /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/manualNormalization/
mkdir preservation
echo "Created preservation folder"
#mkdir access
#echo "Created access folder"

for pcd in /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/*.pcd; do
	convert $pcd[6] -colorspace sRGB /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/manualNormalization/preservation/"`basename $pcd .pcd`.tif"
	#convert $pcd /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/manualNormalization/access/"`basename $pcd .pcd`.jpg"
	echo "Converted $pcd to TIF"
done

for tif in /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/manualNormalization/preservation/*.tif; do
	convert $tif -sampling-factor 4:4:4 -quality 60 -layers merge /home/bcadmin/Desktop/pending_transfers/$accession/$unique_folder/manualNormalization/access/"`basename $tif .tif`.jpg"
	echo "Converted $tif to JPG"
done
