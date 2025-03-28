#!/bin/bash

usage() {
    echo "Użycie: $0 <ścieżka_do_oryginalnego_obrazu>"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi

ORIGINAL_IMAGE="$1"

if [ ! -f "$ORIGINAL_IMAGE" ]; then
    echo "Błąd: Plik '$ORIGINAL_IMAGE' nie istnieje."
    exit 1
fi

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_IMAGE="backup_${TIMESTAMP}"

dd if="$ORIGINAL_IMAGE" of="$BACKUP_IMAGE" bs=4M status=progress

echo "Kopia obrazu została utworzona: $BACKUP_IMAGE"

echo "Generowanie sum kontrolnych..."
MD5_ORIGINAL=$(md5sum "$ORIGINAL_IMAGE" | awk '{print $1}')
MD5_BACKUP=$(md5sum "$BACKUP_IMAGE" | awk '{print $1}')

CHECKSUM_FILE="checksums_${TIMESTAMP}.txt"
echo "Oryginalny: $MD5_ORIGINAL  $ORIGINAL_IMAGE" > "$CHECKSUM_FILE"
echo "Kopia:      $MD5_BACKUP  $BACKUP_IMAGE" >> "$CHECKSUM_FILE"

echo "Sumy kontrolne zapisane w $CHECKSUM_FILE"

if [ "$MD5_ORIGINAL" == "$MD5_BACKUP" ]; then
    echo "Pliki są identyczne." | tee -a "$CHECKSUM_FILE"
else
    echo "UWAGA: Pliki różnią się!" | tee -a "$CHECKSUM_FILE"
fi