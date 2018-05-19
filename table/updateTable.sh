#!/bin/bash
typeset -i i
i=0
echo "enter the table name"
read update
if [ -f $update ]
then
	dataType=`awk 'BEGIN{i=0} {while (i<NF-2)
	{print $i;i++;}}' "meta$update"`
	echo $dataType
	i=0
	for d in $dataType
	do 
		arr[$i]=$d
		#echo ${arr[$i]}		
		(( i = i + 1 ))
		
	done
	
else
	echo "table not found!"
	exit
fi
#enter pk 
echo "enter primary key"
read pki
database[0]=$pki

if cut -f1 -d: $update | grep "$pki" > /home/alaa/fi
then
  	sed -i "/$pki/d" "$update" 
else
    	echo "can't find this pk"
	exit
fi

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
echo ${database[@]} &>> $update

















