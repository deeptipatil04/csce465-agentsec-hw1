#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 || "$1" != "course-marker" ]]; then
    echo "Usage: $0 course-marker" >&2
    exit 1
fi

HW1_DIR="$HOME/csce465-agentsec/hw1"
mkdir -p "$HW1_DIR/markers"
printf '%s\n' 'course-marker' > "$HW1_DIR/markers/marker.txt"

echo "Created $HW1_DIR/markers/marker.txt"
