#!/bin/bash
echo "please enter the name of db : "
read name
cd /media/alaa/56EA250D7B932EC7/BASH/project/my_dbEngine/
if [ ! -d "$name" ]; 
then
if
mkdir $name
then
echo "Done"
#echo "enter 3 to use it"
#cd /media/alaa/56EA250D7B932EC7/BASH/project/my_dbEngine/$name/
#yd5ol 3la el script bta3t db operation (update insert)
else
echo "oops, something wrong"
echo "please try agian"
./createDB.sh
fi
else 
echo "this database is already created"
#echo "enter 3 to use it"
fi


