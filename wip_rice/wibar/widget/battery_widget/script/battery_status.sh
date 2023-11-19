#!/bin/bash

	battery_percent=`cat /sys/class/power_supply/BAT0/capacity`
	battery_status_string=`cat /sys/class/power_supply/BAT0/status`
	
	if [ "$battery_status_string" = "Discharging" ]; then
		battery_status=-1
	else 
		if [ "$battery_status_string" = "Charging" ]; then
			 battery_status=1
		else 
			if [ "$battery_status_string" = "Not charging" ]; then	
				battery_status=0
			else 
				if [ "$battery_status_string" = "Full" ]; then
					battery_status=2
				fi
			fi
		fi
	fi

	echo $battery_status $battery_percent


