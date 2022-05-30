#!/bin/bash

runCloningRepo() {
    if [[ -z "$1" ]]; then
        ask "Repository slug:"
        read -r repository
    else
        repository="$1"
        shift 1
    fi

    if [ -d "${PROJECTS_PATH}/${repository}" ]; then
        exception_message "Error trying to cloning a project with a name that already exists."
    fi

    cd "$PROJECTS_PATH" || exception_unexpected
    git clone git@github.com:CheesecakeLabs/"$repository".git

    if [ ! -d "${PROJECTS_PATH}/${repository}" ]; then
        exception_ssh "$repository"
    fi

    return $?
}
