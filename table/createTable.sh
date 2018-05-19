#!/bin/bash

echo enter Table name
read TableName
if [ ! -f $TableName ] 
	then 
	touch $TableName

	#ask about pk
	echo "primary Key :"
	read pk
	data[0]=$pk

	type[0]=pk

	#ask for number of columns
	typeset -i i
	i=1
	echo "enter the number of columns"
	typeset -i colNum
	read colNum

	#read the columns
	while [ $i -le $colNum ]
	do
		echo enter dataType of column $i 
		select ty in "int" "string"
		do
			case $ty in
			"int") 
				
				type[i]="int"
				echo enter the name of column $i
				read n
				data[i]=$n 
				let i+=1
				echo ${type[@]} > meta$TableName
				echo ${data[@]} &>> meta$TableName				
				break
				;;
			"string")
				
				type[i]="str"
				echo enter the name of column $i
				read n
				data[i]=$n 
				let i+=1				
				echo ${type[@]} > meta$TableName
				echo ${data[@]} &>> meta$TableName				
				break
				;;
			*) 
				echo "invalid data type"
				break				
				;;
			esac
		done
		
	done

	echo "table created successfully"

	else
	echo "table is already existed"
fi




