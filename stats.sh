#!/bin/bash

online="Adapter 0: on-line"
offline="Adapter 0: off-line"

while true
do
    status="$(acpi -a)"
    status_final=$status

    if [[ $status = $offline ]]
    then
        echo $(date +%T) $status >> log.csv
        echo -e "\e[1;30m -----$(date +%T)-----"
        echo -e "\e[1;32m $status \e[1;30m => \e[1;31m POWER SURGE! \e[1;30m "
        aplay alarm -q #Endkommentieren wenn Alarm benötigt (LAUT!)
    else
        echo $(date +%T) $status >> log.csv
        echo -e "\e[1;30m -----$(date +%T)-----"
        echo -e "\e[1;32m $status \e[1;30m"
        sleep 5
    fi
done

