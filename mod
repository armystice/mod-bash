#!/bin/bash
# A special script used to manage Armystice Bash modules
#
SCRIPT_FILE=$(readlink -f ${BASH_SOURCE[0]})
SCRIPT_DIR=$(dirname ${SCRIPT_FILE})

source "${SCRIPT_DIR}/env"

# i.e. mod update
#      mod update
ARMYS_OPERATION="$1"
ARMYS_MOD_NAME="$2"
# git clone ...
if [ "${ARMYS_OPERATION}" == "install" ] || [ "${ARMYS_OPERATION}" == "update" ]; then
    log "${SCRIPT_FILE}" "info" "Updating module ${ARMYS_MOD_NAME}"

    ARMYS_MOD_REPO="${ARMYSTICE_GIT_PUBLIC}/${ARMYS_MOD_NAME}"
    git clone "${ARMYS_MOD_REPO}"
    cd bash
    git pull

    if [ $? -eq 0 ]; then
        log "${SCRIPT_FILE}" "info" "Updated module ${ARMYS_MOD_NAME}"
    else
        log "${SCRIPT_FILE}" "info" "Error updating module ${ARMYS_MOD_NAME}"
    fi
fi