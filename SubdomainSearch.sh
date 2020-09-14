#! /bin/bash

#Subdomain sercher


echo "Please enter your website URL"
read link
wget $link
name=$(echo $link | sed 's/^[^\.]\+\.//')
echo "$name"

grep -o  "[^/]*\.$name" index.html | sed 's/\.com.*/.com/' |sed 's/^.*www/www/' | sort -u  >list.txt
rm index.html
cat list.txt
