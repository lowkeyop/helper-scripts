#!/bin/bash
#Formats all the files already in JSON format to make them a list of JSON documents to be stored in MongoDB
echo "formatting files for bulk insertion"

sed -i 's/^[{]/[{/g' $1 #encapsulates the beginning of item list
sed -i '$ s/[}}]$/}]/g' $1 #encapsulates the end of item list
sed -i '$! s/[}}]$/},/g' $1 #concats items

echo "formatting complete"
echo "displaying results"
cat $1


