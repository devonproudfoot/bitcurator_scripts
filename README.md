# bitcurator_scripts

For use with [BitCurator](http://bitcurator.net/)

by Devon Proudfoot : )

This is a work in progress.  Sometimes I update these and sometimes not. Sometimes I write these scripts well before I actually use them on digital mateiral we recieve so use at your own discretion!  Thanks for checking this out!

#### Scripts
- audio_disks.sh - Will create a folder for the Audio CD, creating a disk image, relevant metadata, and wave files

- video_dvds.sh -

- bag_and_transfer.sh - Uses the [Library of Congress' Python Bagit Script](https://github.com/LibraryOfCongress/bagit-python) to bag an accession and transfer it to Archivematica staging area

- floppy_image.sh - creates a disk image of the floppy and and scans for viruses with ficlam.  NEEDS TO BE TESTED STILL.

- rsync_copy.sh - Copies files with rsync.  I don't know why I made this.  I might have gone mad with shell script powers.

- create_accessions.sh - Enter the accession number and unique identifier to automatically create folders for the media being transferred.  Also includes a number of python scripts that will move the media photographs and create a media removal notice if necessary.

- pcd_normalize.sh - For use with ".pcd" files found on Kodak Photo CDs. This uses imagemagick's convert to create preservation tifs in a directory structure that is compliant with Archivematica's Manual Normalization feature.  Remove the comments to also create jpgs from the tif files.
