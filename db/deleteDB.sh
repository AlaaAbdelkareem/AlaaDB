#!/bin/bash
echo "enter the db name"
read delName
if [ -d $delName ]
then
echo "Are you sure? Y/N"
read asn
if [ $asn == "Y" ]
then
rm -r /media/alaa/56EA250D7B932EC7/BASH/project/my_dbEngine/$delName/
echo "Done"
fi
fi
