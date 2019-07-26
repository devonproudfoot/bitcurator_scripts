#!/bin/sh

echo -n "Installing pdfkit"
sudo pip3 install pdfkit

echo -n "Installing hashlib"
sudo pip3 install hashlib

echo -n "Installing pdf2html"
sudo apt-get install wkhtmltopdf

echo -n "Installing handbrake CLI and GUI"
sudo apt-get install handbrake-cli
sudo apt-get install handbrake-gtk


# Install msgcovert per instructions, https://www.matijs.net/software/msgconv/
echo -n "Installing msgconvert"
sudo apt-get install libemail-outlook-message-perl


mkdir /home/bcadmin/Desktop/pending_transfers
mkdir /home/bcadmin/Desktop/photographs
mkdir /home/bcadmin/Desktop/photographs/transferred
mkdir /home/bcadmin/Desktop/bc_reports
mkdir /home/bcadmin/Desktop/working
mkdir /home/bcadmin/Desktop/working/AIPs
