#!/bin/bash
echo "db name is :"
read useDB
cd /media/alaa/56EA250D7B932EC7/BASH/project/my_dbEngine/
if [ -d "$useDB" ];
then
cd /media/alaa/56EA250D7B932EC7/BASH/project/my_dbEngine/$useDB/

echo "changed to $useDB"
#after chose use database and cd the dir
select choice in "Show all Tables" "Create Table" "update Table" "Insert Table" "Delete Table"
do
case $choice in
"Show all Tables") ./../../table/showTables.sh
;;
"Create Table") ./../../table/createTable.sh
;;
"update Table") ./../../table/updateTable.sh
;;
"Insert Table") ./../../table/insert.sh
;;
"Delete Table") ./../../table/deleteTable.sh
;;
esac
done  
else 
echo "Not found!"
fi


