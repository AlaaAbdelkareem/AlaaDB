#!/bin/bash
typeset -i i
i=0
echo "enter the table name"
read insert
if [ -f $insert ]
then
	dataType=`awk 'BEGIN{i=0} {while (i<NF-2)
	{print $i;i++;}}' "meta$insert"`
	echo $dataType
	i=0
	for d in $dataType
	do 
		arr[$i]=$d
		echo ${arr[$i]}		
		(( i = i + 1 ))
		
	done
	
else
	echo "table not found!"
	exit
fi
#enter pk 
echo "insert primary key"
read pki
database[0]=$pki

j=1
for i in ${arr[@]}
do
	if [ "$j" == "${#arr[@]}" ]
	then
	break
	fi
        echo value of column $j
	read v
	if [[ $v =~([0-9]) ]]
	then
		s="int"
	elif [[ $v =~([[:upper:]]|[[:lower:]]) ]] 
	then
		s="str"
	fi
	if [ "${arr[$j]}" ==  "$s" ]
	then
		database[$j]=$v
	else 
		echo "not valid"
		read v
	fi
	
	let j+=1
done
echo ${database[@]} &>> $insert

