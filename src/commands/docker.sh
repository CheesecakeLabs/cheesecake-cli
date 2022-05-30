#!/bin/bash

runCheckDocker() {
    runCheckDockerIsInstalled
    runCheckDockerIsRunning
}

runCheckDockerIsInstalled() {
    if ! exists docker; then
        brew install --cask docker
    fi
}

runCheckDockerIsRunning() {
    if [ ! "$(docker ps)" ]; then
        printf "⚠️ %b Opening docker app, this can take a while...%b\n\n" "$COL_RED" "$COL_RESET"
        open /Applications/Docker.app
        
        sleep 10
        
        while [ ! "$(docker ps)" ]
        do
            printf "...%bstill oppening docker app, please wait!%b\n\n" "$COL_RED" "$COL_RESET"
            sleep 10
        done
    fi
}
