#!/bin/bash
gre='\033[1;32m'
red='\033[1;31m'
yel='\033[1;33m'
blu='\033[1;34m'
while [ 1 ]
do
	clear
	echo "$red          ==============================="
	echo "$blu          | ------             |   ---- |"
	echo "$yel          |   |    ----  ----  |   |    |"
	echo "$gre          |   |   |    ||    | |   ---- |"
	echo "$blu          |   |    ----  ----  |   ____||"
	echo "$red          ==============================="
	echo "$blu               <<<<<Hacking tools>>>>"
	echo "$yel          1 - metasploit        5 - hakku"
	echo "$yel          2 - weeman            6 - sudo"
	echo "$yel          3 - horor             7 - exit"
	echo "$yel          4 - Term-X"
	echo "$gre          -------------------------------"
	echo
	echo -n "$blu Which wepon you want :- "
	read selection
	if [ $selection -eq 1 ]
	then
		apt-get update -y
		apt-get upgrade -y
		apt-get install curl -y
		apt-get install git -y
		clear
		cd meta
		cp metasploit.sh $HOME
		cd $HOME
		chmod +x metasploit.sh
		sh metasploit.sh
		rm -rf metasploit.sh
	elif [ $selection -eq 2 ]
	then
		apt-get install git -y
		clear
		cd $HOME
		git clone https://github.com/evait-security/weeman
		apt-get install python2 -y
		pip2 install bs4
		clear
		sleep 1
		echo "$gre      ======================"
		echo "$gre      successfully installed"
		echo "$gre      ======================"
	elif [ $selection -eq 3 ]
	then
		apt-get install git -y
		clear
		cd $HOME
		git clone https://github.com/sachin175638/horor
		cd horor
		chmod +x horor.sh
		ln -s $HOME/horor/horor.sh /data/data/com.termux/files/usr/bin/horor
		clear
		sleep 1
		echo "$gre      ======================"
		echo "$gre      successfully installed"
		echo "$gre      ======================"
		echo "$gre      execute horor"
 	elif [ $selection -eq 4 ]
	then
		apt-get install git -y
		clear
		cd $HOME
		git clone https://github.com/sachin175638/Term-X
		cd Term-X
		chmod +x setup.sh
		sh setup.sh
		cd $HOME
		ln -s $HOME/Term-X/turrmux.sh /data/data/com.termux/files/usr/bin/term
		clear
		sleep 1
		echo "$gre      ======================"
		echo "$gre      successfully installed"
		echo "$gre      ======================"
		echo "$gre      execute term"
	elif [ $selection -eq 5 ]
	then
		apt-get install git -y
		clear
		cd $HOME
		git clone https://github.com/4shadoww/hakkuframework
	elif [ $selection -eq 6 ]
	then
		apt-get install git -y
		clear
		cd $HOME
		git clone https://github.com/st42/termux-sudo
		cd termux-sudo
		cat sudo > /data/data/com.termux/files/usr/bin/sudo
		chmod 700 /data/data/com.termux/files/usr/bin/sudo
	elif [ $selection -eq 7 ]
	then
		echo "$blu bye bye...."
		break
	else
		echo "wrong selection......"
	fi
echo "$red--------  Press enter to continue --------"
read x
done


