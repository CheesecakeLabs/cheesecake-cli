#!/bin/bash

showHelp() {
    title "HOW TO USE THIS CLI:"

    printf "%bckl%b %b<command>%b %b<args?>%b\n" "$COL_LGREEN" "$COL_RESET" "$COL_RED" "$COL_RESET" "$COL_LGRAY" "$COL_RESET"
    printf "* parameters with %b< ?>%b are optionals \n" "$COL_LGRAY" "$COL_RESET"
    
    title "COMMANDS:"
    printf "%bckl%b %bnew%b %b<customer?> <project?>%b    Create new project \n" "$COL_GREEN" "$COL_RESET" "$COL_RED" "$COL_RESET" "$COL_LGRAY" "$COL_RESET"
    printf "%bckl%b %badd%b %b<stack?> <project?>%b       Add a new starter on a project \n" "$COL_GREEN" "$COL_RESET" "$COL_RED" "$COL_RESET" "$COL_LGRAY" "$COL_RESET"
    printf "%bckl%b %butils install%b %b<util-name?>%b    Install utils \n" "$COL_GREEN" "$COL_RESET" "$COL_RED" "$COL_RESET" "$COL_LGRAY" "$COL_RESET"
    printf "%bckl%b %bhelp%b                          Show this help screen \n" "$COL_GREEN" "$COL_RESET" "$COL_RED" "$COL_RESET"
    printf "\n\n"
}
