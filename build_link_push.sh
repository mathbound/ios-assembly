#!/bin/bash

SRC="$1"
OUT="$2"
IP="$3"
DEST="$4"

if [[ -z "$SRC" || -z "$OUT" || -z "$IP" || -z "$DEST" ]]; then
    echo "Usage: $0 <source.s> <output_binary> <ip_address> <remote_full_path>"
    exit 1
fi

OBJ="${OUT}.o"

cc -target arm64-apple-macos -arch arm64 -Wall -nostdlib -Wl,-e,_start -c "$SRC" -o "$OBJ"
cc -target arm64-apple-macos -arch arm64 -Wall -nostdlib "$OBJ" -o "$OUT" -Wl,-e,_start -lc

scp "./$OUT" "root@$IP:$DEST"
