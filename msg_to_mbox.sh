#!/bin/sh

read -n "What is the folder you would like to convert? "
read input

read -n "What would you like to name the mbox file? "
read output


msgconvert --mbox $output $input/*msg