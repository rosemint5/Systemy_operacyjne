#!/bin/bash

LOGFILE="/var/log/monitor_ports.log"

INTERVAL=60

monitor_ports(){
    echo "[$(date)] Monitoruje otwarte porty..." >> "$LOGFILE"
    
    if command -v ss &> /dev/null; then
        ss -tuln >> "$LOGFILE"
    elif command -v netstat &> /dev/null; then
        netstat -tuln >> "$LOGFILE"
    else
        echo "Ani 'ss' ani 'netstat' nie są zainstalowane." >> "$LOGFILE"
        exit 1
    fi
    
    echo "______________________________" >> "$LOGFILE"
}

while true; do
    monitor_ports
    sleep "$INTERVAL"
done