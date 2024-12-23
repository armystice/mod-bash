#!/bin/bash
SCRIPT_FILE=$(readlink -f ${BASH_SOURCE[0]})
SCRIPT_DIR=$(dirname ${SCRIPT_FILE})

if [ -n "$1" ]; then
    cd "$1"
fi

CURRENT_DIR=$(pwd)
if [[ "${CURRENT_DIR}" =~ "/mnt/[a-zA-z0-9\-\_]*" ]]; then
    echo "Setting up mount directories..."

    HOME_DIR="home/${USER}"
    mkdir "${HOME_DIR}"
    chown "${USER}" "${USER}"

    cd "${HOME_DIR}"
else
    echo "Directory is not a mount"
fi