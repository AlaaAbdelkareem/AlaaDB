#!/bin/bash
echo "enter the table name"
read del
if [ -f $del ]
then
select choice in "delete all table" "delete specific row"
do
case $choice in
"delete all table")
rm -f $del
echo "done"
exit
;;
"delete specific row") 
echo "enter the word to search"
read word
if cut -f1 -d: $del grep "$word"
then
    sed -i "/$word/d" "$del" 
else
    echo "can't find this word"
fi
;;
esac
done
else 
echo "not found"
fi











