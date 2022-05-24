#!/bin/bash

showHelp() {
    title "HOW TO USE THIS CLI:"

    printf "%bckl%b %b<command>%b <args?>\n" "$COL_LGREEN" "$COL_RESET" "$COL_RED" "$COL_RESET"
    printf "* parameters with %b< ?> are optionals%b \n\n" "$COL_CYAN" "$COL_RESET"
    
    title "BASIC COMMANDS:"
    printf "%bckl%b %bnew%b                         Create new project \n" "$COL_GREEN" "$COL_RESET" "$COL_RED" "$COL_RESET"
    printf "%bckl%b %bhelp%b                        Show this help screen \n" "$COL_GREEN" "$COL_RESET" "$COL_RED" "$COL_RESET"
    
    printf "\n"
}
