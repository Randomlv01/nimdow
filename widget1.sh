#!/bin/bash

while true; do
    # CPU-Auslastung
    CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *$[0-9.]*$%* id.*/\1/" | awk '{print 100 - $1}')

    # RAM-Nutzung
    RAM=$(free -h | grep "Mem" | awk '{print $3 "/" $2}')

    # Festplattenspeicher
    DISK=$(df -h | grep "/dev/sda1" | awk '{print $3 "/" $2}')  # Hier möglicherweise anpassen
    
    # Uhrzeit
    TIME=$(date +"%H:%M")
    
    # Lautstärke
    VOLUME=$(amixer get Master | grep -o "[0-9]*%" | head -n 1)

    # Setzen der xsetroot-Anzeige
    xsetroot -name "DISK: ${DISK} | TIME: ${TIME} | VOLUME: ${VOLUME}"

    sleep 5  # Aktualisierungsintervall
done

