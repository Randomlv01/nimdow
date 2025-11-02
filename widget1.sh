#!/bin/bash

while true; do

    red=$'\e[31m'
    green=$'\e[32m'
    blue=$'\e[34m'
    magenta=$'\e[35m'
    cyan=$'\e[36m'
    white=$'\e[0m'    

    # CPU-Auslastung
  #  CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *$[0-9.]*$%* id.*/\1/" | awk '{print 100 - $1}')

    # RAM-Nutzung
  #  RAM=$(free -h | grep "Mem" | awk '{print $3 "/" $2}')

    # Festplattenspeicher
    DISK=$(df -h | grep "/dev/sda1" | awk '{print $3 "/" $2}')  # Hier möglicherweise anpassen
    
    # Uhrzeit
    TIME=$(date +"%H:%M")


            MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}')
        CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' )
        TEMP=$(sensors|grep 'Core 0'|awk '{print $3}' )
        WIFI=$(nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2}')

    # Lautstärke
    VOLUME=$(amixer get Master | grep -o "[0-9]*%" | head -n 1)

    # Setzen der xsetroot-Anzeige
    xsetroot -name "${red}DISK: ${DISK}${white} | ${cyan}TIME: ${TIME}${white} | ${magenta}VOLUME: ${VOLUME}${white} | ${green}$TEMP "

    sleep 0.1  # Aktualisierungsintervall
done

