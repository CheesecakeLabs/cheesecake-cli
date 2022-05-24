#!/bin/bash

runMainMenu() {
    local menu_items=(
        "Create new project"
        "Add stack to an existing project"
        "Help"
        "Exit"
    )

    run_menu "${menu_items[@]}"

    case "$SELECTED"
    in
        0)
            printf "\n\n"
            runCreateNewProject
        ;;
        1)
            printf "\n\n"
            runAddAnStack
        ;;
        2)
            printf "\n\n"
            showHelp
        ;;
        3) exit;;
    esac

    return $?
}
