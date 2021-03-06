#!/bin/bash
# tai-euler
# automating: 
# -network interface search
# -MAC address change for network interfaces
# -hostname change

# get the name of ALL network interfaces
network_interfaces_array=( $(basename -a /sys/class/net/*) )

# loop through ALL network interfaces and change MAC address
for i in "${network_interfaces_array[@]}"
do
    echo $i
    sudo ifconfig $i down
    sleep .5
    sudo macchanger -A $i
    sleep .5
    sudo ifconfig $i up
    sleep .5
done

# show new MAC addresses
for i in "${network_interfaces_array[@]}"
do
    echo ============$i==================
    macchanger $i
    sleep .5
done

# change hostname on computer 
echo ==========changing hostname============
echo ========== shuf -n 1 *ADD PATH TO A WORDLIST*============

hostname=( $(shuf -n 1 "ADD PATH TO A WORDLIST") )
echo new hostname: $hostname
sleep .5
new_line="127.0.0.1       localhost $hostname"
sudo sed -i "1s/.*/$new_line/" /etc/hosts
sleep .5
hostnamectl set-hostname "$hostname"
sleep .5

echo ===== now restart terminal =====



