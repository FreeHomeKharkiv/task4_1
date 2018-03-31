#!/bin/bash

touch .task4_1.out
chmod 777 .task4_1.out
exec 1>.task4_1.out

###CPU in your PC
CPU=$(cat /proc/cpuinfo | grep 'model name' | awk '{print $4 $5 $6 $7}')
if [[ -z $CPU ]];
then
    echo "CPU: Unknown"
else
    echo "CPU: "$CPU
fi

###RAM in your PC
RAM=$(free -m | grep Mem: | awk '{print $2"MB"}')
    echo "RAM: "$RAM 

###Motherboard in your PC
Motherboard=$(dmidecode --type baseboard | grep 'Manufacturer:' |awk '{print $2}')
if [[ -z $Motherboard ]];
then 
    echo "Motherboard: Unknown"
else
    echo "Motherboard: "$Motherboard 
fi


###System Serial Number
SSN=$(dmidecode -s system-serial-number)
if [[ -z $SSN ]];
then 
   echo "System Serial Number: Unknown"
else 
   echo "System Serial Number: "$SSN
fi

### Info about your OS
echo "---System---"

OSDist=$(uname -o) 
    echo "OS Distribution: "$OSDist

###Kernel for your OS
Kernel=$(uname -r)
    echo "Kernel version: "$Kernel

###Installation date
Date=$(stat /var/log/installer/ | grep Change | awk '{print $2}')
echo "Installation date: "$Date

###Hostname
   echo "Hostname: "$HOSTNAME

###Uptime 
Uptime=$(uptime -p)
     echo "Uptime: "$Uptime

###Processes running
PrRun=$(ps -ef | wc -l)
echo "Processes running: "$PrRun

###Users logged in your system

UsersLogged=$(cat /etc/passwd | awk -F: '{if ($3>=1000) print $1}' | wc -l)
echo "Users logged in: "$UsersLogged


###Your network

echo --- Network ---
Network=$(ip -o -4 a | awk '$2 >=6 { print $2 ":" $4 }')
echo -e "$Network"
