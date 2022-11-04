#!/bin/bash

set -euo pipefail
current_path="$(realpath $0)"
current_dir="$(dirname $current_path)"

function enable() {
	./venv/bin/python ./main.py /etc/hosts ./sites.txt
}

function disable() {
	./venv/bin/python ./main.py /etc/hosts ./sites.txt --disable
}

if [[ $1 =~ ^(enable|disable)$ ]]; then
	"$@"
else
	help
	exit 1
fi
