#!/bin/bash
# lucien@lucien.ink
# Lucien Shui copy rights.
if [[ $# != 2 ]]; then
	echo "Usage <remote_list> \"<command>\""
	exit 1
fi

while read line; do
	HOST=`echo $line | cut -d " " -f 1`
	USERNAME=`echo $line | cut -d " " -f 2`
	PASSWORD=`echo $line | cut -d " " -f 3`
	expect << EOF
		set timeout 10
		spawn ssh $USERNAME@$HOST $2
		expect {
			"yes/no" {
				send "yes\n"
				exp_continue
			}
			"password" {
				send "$PASSWORD\r" 
				expect EOF
			}
		}
EOF
	echo ''
done < ${1}
