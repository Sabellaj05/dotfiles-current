#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

PROCESS=$1

MEM_KB=$(ps -C "$PROCESS" -o rss= | awk '{sum+=$1} END {print sum}')
MEM_MB=$(echo "$MEM_KB / 1024" | bc -l)

# printf "Total RAM used by '%s': %.2f MB\n" "$PROCESS" "$MEM_MB"

# problemas con puntos y comas para los decimales, asi funca bien
LC_NUMERIC=C printf "Total RAM used by '%s': %.2f MB\n" "$PROCESS" "$MEM_MB"
