#!/bin/bash

	#Add user to group
	#If user doen't exists then a new is created and same to the group
echo "Welcome to GITAU'S ENTREPRICE"
echo "           =================="

#Prompts user with the text and the input from user gets stored to variable name
echo "Please type your username:"
read name
#logic; if user typed does not exists then new one is created and results gets logged to .txt(file)
if ! getent passwd "$name" > /dev/null; then
	sudo adduser "$name"
	echo "Username $name created successfully!"
	echo "$(date): Username $name was created successfully!" >> loggs2.txt
#logic; if user exists then no new creation happens
else
	echo "Username $name exists and ready to be added"
	echo "$(date): Username $name exists!" >> loggs2.txt
fi

#Prompts user with the text where he/she must add the desired group
echo "Please type your designited group:"
read groupname
#If group does not exist then new one is created and logged
if ! getent group "$groupname" > /dev/null; then
	sudo addgroup "$groupname"
	echo "Group $groupname created successfully!"
	echo "$(date): Group $groupname was created successfully!" >> loggs2.txt
#Checks whether group exists
else
	echo "Group $groupname exists"
	echo "$(date): Group $groupname exists!" >> loggs2.txt
fi

#This command adds user to the group he/she desired and results gets logged to the .txt(file)
sudo usermod -aG "$groupname" "$name"
	echo "    Processing your request...."
	echo "Addition happenned successfully"
	echo "$(date): User $name was added successfully to group $groupname!" >> add.txt
