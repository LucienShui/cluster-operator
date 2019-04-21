#!/bin/bash
# lucien@lucien.ink
# Lucien Shui copy rights.
if [[ $# != 3 ]]; then
	echo "Usage <remote_list> <local_path> <remote_path>"
	exit 1
fi

while read line; do
	HOST=`echo $line | cut -d " " -f 1`
	USERNAME=`echo $line | cut -d " " -f 2`
	PASSWORD=`echo $line | cut -d " " -f 3`
	expect << EOF
		set timeout 10
		spawn scp -r $2 $USERNAME@$HOST:$3
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
