#!/bin/bash
echo
echo "                          Welcome to our engine!"
echo 
select choice in "Create db" "Show dbs" "Use db" "Delete db"
do
case $choice in
"Create db") ./db/createDB.sh
;;
"Show dbs") ./db/showDB.sh 
;;
"Use db") ./db/useDB.sh 
;;
"Delete db") ./db/deleteDB.sh
;;
esac
done 
