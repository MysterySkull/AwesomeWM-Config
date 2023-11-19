#!/bin/bash

if [[ $(nmcli -t d | grep "ethernet" | tr ':' ' ' | awk '{print $3}') = "unavailable" ]]; then 
	if [[ $(nmcli -t d | grep "wifi" | awk 'NR==1' | tr ':' ' ' | awk '{print $3}') = "unavailable" ]]; then
		echo "no-connection Disconnected"
	else
		if [[ $(nmcli -t d | grep "wifi" | awk 'NR==1' | tr ':' ' ' | awk '{print $3}') = "disconnected" ]]; then
			echo "no-wifi Disconnected"
		else
			echo "wifi" $(nmcli -t d | grep "wifi" | awk 'NR==1' | tr ':' ' ' | awk '{print $4}')
		fi
	fi
else
	echo "ethernet Filiaire"
fi
