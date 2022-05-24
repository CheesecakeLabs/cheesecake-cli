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
    printf "\n\n%b Check your command and try again,\n if the error persists please report it.%b \n\n\n" "$COL_LGRAY" "$COL_RESET"
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

exception_arguments() {
    exception_header
    printf "Expected arguments not found."
    exception_bottom
    exit
}

exception_random() {
    exception_header
    printf " An unexpected error has occurred at %b%s%b." "$COL_YELLOW" "$1" "$COL_RESET"
    exception_bottom
    exit
}

exception_aborted() {
    exception_header
    printf " You just aborted this command"
    printf "\n\n\n"
    exit
}