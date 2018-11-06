#!/bin/sh

echo -n "Installing pdfkit"
sudo pip3 install pdfkit

echo -n "Installing hashlib"
sudo pip3 install hashlib

echo -n "Installing pdf2html"
sudo apt-get install wkhtmltopdf

echo -n "Installing handbrake CLI"
sudo apt-get install handbrake-cli handbrake-gtk
