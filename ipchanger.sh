#!/bin/bash


rdm_MAC(){
	hexchars="0123456789ABCDEF"
	echo "02$(for i in {1..5}; do echo -n :${hexchars:$(( $RANDOM % 16 )):1}${hexchars:$(( $RANDOM % 16 )):1}; done)"
}



ip=$(ifconfig wlan0 | grep 'inet ' | awk '{print $2}')
echo current ip : $ip
echo "changeing ip ----------"

#command to change ip
sudo ip link set dev wlan0 down
sudo ip link set dev wlan0 address $(rdm_MAC)
sudo ip link set dev wlan0 up

sudo dhclient -r wlan0
sudo dhclient wlan0
echo $(ifconfig wlan0)



