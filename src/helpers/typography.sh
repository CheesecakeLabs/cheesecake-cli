#!/bin/bash

title() {
    printf "\n%b%s%b\n" "$COL_YELLOW" "$@" "$COL_RESET"
}

subtitle() {
    printf "\n%b%s%b\n" "$COL_CYAN" "$@" "$COL_RESET"
}

step() {
    printf "\n%b%s...%b\n\n" "$COL_GREEN" "$@" "$COL_RESET"
}

ask() {
    printf "\n%b%s%b " "$COL_GREEN" "$@" "$COL_RESET"
}
