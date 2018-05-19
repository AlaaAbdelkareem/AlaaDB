#!/bin/bash
if [ -f $TableName ] 
then 
	ls
	echo
	echo "do you want to diplay specific table?(Y/N) "
	read ans
	if [ $ans == "Y" ]
	then
		echo "enter the table name"
		read tb
		if [ -f $tb ]
		then
			select choice in "Display all table" "Display specific row"
			do
				case $choice in
				"Display all table") cat $tb
				exit
				;;
				"Display specific row") 
					echo "enter the word ro search"
					read word
					if grep "$word" $tb
					then
					    sed '1,$word' $tb
					else
					    echo "can't find this word"
					fi
				exit
				;;
				esac
			done
		fi 
	fi
	else
	exit
fi
