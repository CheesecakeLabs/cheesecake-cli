#!/bin/bash

runInstallUtils() {
    local util

    if [[ -z "$1" ]]; then
        local menu_items=(
            "Docker"
            "Git"
        )

        title "Select what to install:"
        run_menu "${menu_items[@]}"
        util="$SELECTED"
    else
        util="$1"
        shift 1
    fi

    case "$util"
    in
        0)
            printf "\n\n"
            runInstallUtilDocker
        ;;
        1)
            printf "\n\n"
            runInstallUtilGit
        ;;
        *) exit;;
    esac

    return $?
}

runInstallUtilDocker() {
    if ! exists docker; then
        brew install --cask docker
    else
        exception_message "Docker is already installed"
    fi

    succes "Docker successfully installed"
}

runInstallUtilGit() {
    if ! exists docker; then
        brew install git
    else
        exception_message "Git is already installed"
    fi

    succes "Git successfully installed"
}
