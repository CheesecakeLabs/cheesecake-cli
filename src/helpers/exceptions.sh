#!/bin/bash

exception_header() {
    printf "\n"
    printf "┈┈┈┈┈╭━━━━━╮┈┈ \n"
    printf "┈┈┈┈╭┻━━┳╮┈┃┈┈  Well, we're boned... \n"
    printf "┈┈┈┈┃▆┈▆┃┃┈┃┈┈ \n"
    printf "┈┈┈┈╰┳━━┻╯┈┃┈┈  Something seems to be \n"
    printf "┈┈┈┈┈┣┳┳┳╮┈┃┈┈  wrong around here! \n"
    printf "┈┈┈┈┈┣┻┻┻╯┈┃┈┈ \n\n\n"
}

exception_bottom() {
    if [ -z "$1" ]; then
        printf "\n\n%b Check your command and try again,\n if the error persists please report it.%b \n\n\n" "$COL_LGRAY" "$COL_RESET"
    else
        printf "\n\n%b %s %b \n\n\n" "$COL_LGRAY" "$@" "$COL_RESET"
    fi
}

exception_ssh() {
    exception_header
    printf " Wasn't possible to clone the %b%s%b repository!\n\n" "$COL_YELLOW" "$1" "$COL_RESET"
    exception_bottom " Please check your ssh key and try again."
    printf "\n\n\n"
    exit
}

exception_repository() {
    exception_header
    printf " Repository %b%s%b not found!\n\n" "$COL_YELLOW" "$1" "$COL_RESET"
    printf " Please make sure the path \n %b%s/%s%b exists and try again." "$COL_CYAN" "${PROJECTS_PATH}" "$1" "$COL_RESET"
    printf "\n\n\n"
    exit
}

exception_command() {
    exception_header
    printf " Command %b%s%b not found." "$COL_YELLOW" "$1" "$COL_RESET"
    exception_bottom
    exit
}

exception_message() {
    exception_header
    printf " %b%s%b." "$COL_YELLOW" "$@" "$COL_RESET"
    exception_bottom
    exit
}

exception_unexpected() {
    exception_message " An unexpected error has occurred."
}

exception_arguments() {
    exception_message "Expected arguments not found."
}
