#!/bin/bash

checkCommands() {
    # if first arg an service name pick first arg as service
    if [[ "$MAIN_COMMANDS" =~ $1 ]]; then
        COMMAND="$1"
        shift 1
    
    # if no service detected pick "menu"
    else
        COMMAND="menu"
    fi
    
    export COMMAND
}

checkProject() {
    cd "${PROJECTS_PATH}" || exception_random

    if [[ -z "$1" ]]; then
        subtitle "Select an project:"
        
        projects=$(ls -d */ | tr -d /)
        run_menu $projects

        projects=($projects)
        project=${projects[$SELECTED]}
    else
        project="$1"
    fi

    if [[ ! -d "${PROJECTS_PATH}/$project" ]]; then
        exception_repository "$project"
    fi

    export PROJECT="$project"
}

checkStarter() {
    if [[ "$1" ]]; then
        starter="$1"
    fi

    starters=(
        "python-django"
        "nodejs-typescript"
        "react-typescript"
        "react-native-typescript"
        "flutter"
    )

    subtitle "Choose the stack:"
    run_menu "${starters[@]}"
    starter=${starters[$SELECTED]}

    if [[ ! -d "${CKL_PATH}/engineering/starters/${starter}" ]]; then
        exception_repository "$starter"
    fi

    export STARTER="$starter"
}