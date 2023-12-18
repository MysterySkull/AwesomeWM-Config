#!/bin/bash

#d'abord il faut savoir si on est sur la sortie externe ou si on est sur un headseat bluetooth non
#Ensuite il faut savoir si on est mute ou pas
#Enfin il faut savoir quel est le volume du mixer

#if [[ $(pulsemixer -l | grep Default | awk '{print $7}') = "0," ]]; then
#	echo "pas mute"
#else
#	echo "mute"
#fi

echo -n $(pulsemixer --get-mute) ' '
echo $(pulsemixer --get-volume | awk '{print $1}')
