#!/bin/bash
if [ -n "$1" ]; then
    cd "$1"
fi

CURRENT_DIR=$(pwd)
if [[ "${CURRENT_DIR}" =~ ".*/home" ]]; then
    mkdir -vp "${HOME}/Documents/GitRepos/github"
    mkdir -vp "${HOME}/Downloads"
    mkdir -vp "${HOME}/Games/SteamLibrary"

    chown "${USER}" "${CURRENT_DIR}" 
fi

