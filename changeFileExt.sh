#!/bin/bash

#read the file name from the command line and chnage the file extension

if [-z "$1"]; then
    fileName="$1"
fi
ext=${fileName%.*}
mv $fileName $ext.
