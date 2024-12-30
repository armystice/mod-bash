#!/bin/bash
if [ -n "$1" ]; then
    cd "$1"
fi

CURRENT_DIR=$(pwd)
if [[ "${CURRENT_DIR}" =~ ".*/home" ]]; then
    sudo mkdir -vp "Documents/GitRepos/github"
    sudo mkdir -vp "Downloads"
    sudo mkdir -vp "Games/SteamLibrary"

    sudo chown "${USER}" ./* 
fi

