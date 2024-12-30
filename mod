#!/bin/bash
# A special script used to manage Armystice Bash modules
#
SCRIPT_FILE=$(readlink -f ${BASH_SOURCE[0]})
SCRIPT_DIR=$(dirname ${SCRIPT_FILE})

source "${SCRIPT_DIR}/init"

# i.e. mod update
#      mod update
SCRIPT_OPERATION="$1"
MOD_NAME="$2"
# git clone ...
if [ "${ARMYS_OPERATION}" == "install" ] || [ "${ARMYS_OPERATION}" == "update" ]; then
    log "${SCRIPT_FILE}" "info" "Updating module ${MOD_NAME}"

    cd "${ARMYSTICE_MOD_HOME}"
    ARMYS_MOD_REPO="${ARMYSTICE_GIT_PUBLIC}/${MOD_NAME}"
    git clone "${ARMYS_MOD_REPO}"
    cd "${MOD_NAME}"
    git pull

    if [ $? -eq 0 ]; then
        log "${SCRIPT_FILE}" "info" "Updated module ${MOD_NAME}"
    else
        log "${SCRIPT_FILE}" "info" "Error updating module ${MOD_NAME}"
    fi
fi