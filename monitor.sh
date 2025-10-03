#!/bin/bash

. "$(dirname "$0")/common.sh"

# quiet exit if lockfile missing
LOCKFILE="${$BASE_DIR}/running.lock"
[ -f "$LOCKFILE" ] || exit 0

if ! screen -ls | grep -q "msh-minecraft"; then
  screen -dm -S msh-minecraft "${BASE_DIR}/msh.bin"
fi
