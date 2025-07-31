 #!/bin/bash
	#What the script does it checks whether the group typed exists or not.
	#If it does not exists then it creates a new one and logs the result to a file(.txt)
	#If it exists then the results get logged to a file(.txt)

echo "WELCOME TO CONSEVI COMPANY"

#Prompts user with the text so that he/she can add a group
echo "Please add your disgnited group:"
read groupname

#If user types the group with upper case it translates it to lowercase therefore error-free.
groupname=$(echo "$groupname" | tr '[:upper:]' '[:lower:]')

# If the group does not exist then it creates a new one and logs the result
if ! getent group "$groupname" > /dev/null ; then
	sudo addgroup "$groupname"
	echo "Processing..."
	echo "$(date)-> Your group $groupname was added successfully ..check logss.txt"
	echo "$(date)-> Your group $groupname was added successfully." >> logss.txt
#If it exists then the results gets logged to a file
else
	echo "$(date)-> Your group $groupname exists ..check logss.txt"
 	echo "$(date)-> Your group $groupname exists." >> logss.txt
fi
