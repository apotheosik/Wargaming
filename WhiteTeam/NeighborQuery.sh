#!/bin/bash
#Chris Sequeira
#Unix presence test - iterate through awk'd ARP'ed devices 
#return results to user 

#awk trims parentheses; writes ARP table IPs to array
addresses=($(arp -a | awk ' { print substr($2, 2, length($2) - 2 ) } '))


#for each IP
for host in "${addresses[@]}"		
do
	#declare singular ping response as variable - will be null for any ping failure
	reply=$(ping $host -c 1  | grep from)	

	#if ping succeeded
	if [ "$reply" ]
	then
		echo host $host unavailable 
	else
		echo host $host available 
	fi
done 
#______________________________________________________________________
#uses /dev/tcp to ping 


#read -p "Enter port to check on local devices:	" port

#for host in "${addresses[@]}"
#do
	#timeout --command-status 1 bash -c '> /dev/tcp/$host/$port'
	 #echo C > /dev/tcp/$host/80 & sleep 5; kill$!
	#echo $? $host
	
#done
#exit 0
