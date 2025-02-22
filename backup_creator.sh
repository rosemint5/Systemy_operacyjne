#!/bin/bash

BACKUP="$HOME/backup"

if [ ! -d "$BACKUP" ]; then
    mkdir -p "$BACKUP"
fi

echo "Podaj, które pliki lub katalogi mają być skopiowane, odzielając je spacjami: "
read -p "> " -a KOPIA

#KOPIA=("/home/user/documents" "/home/user/pictures")

LOG="$BACKUP/log/backup.log"

if [ ! -d "$BACKUP/log" ]; then
    mkdir -p "$BACKUP/log"
fi

CZAS=$(date +"%Y%m%d-%H%M%S")

BACKUP_PLIK="${BACKUP}/backup_${CZAS}.tar.gz"

echo "[$CZAS] Tworzenie kopii zapasowej..." >> $LOG

tar -czf "$BACKUP_PLIK" "${KOPIA[@]}" >> $LOG 2>&1

if [ $? -eq 0 ]; then
    echo "Kopia zapasowa utworzona pomyślnie: $BACKUP_PLIK"
    echo "Kopia zapasowa utworzona pomyślnie: $BACKUP_PLIK" >> $LOG
    echo "Plik logów: $LOG"
else
    echo "Wystąpił błąd podczas tworzenia kopii zapasowej."
    echo "Wystąpił błąd podczas tworzenia kopii zapasowej." >> $LOG
    echo "Plik logów: $LOG"
fi

echo " " >> $LOG
