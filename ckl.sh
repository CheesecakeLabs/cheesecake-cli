#!/usr/bin/env bash

source ./src/bootstrap.sh

# check service and command
# $COMMAND and $SERVICE globals
checkCommands "$@"
shift 1

tput reset
showHeader

case "$COMMAND" in
    ###################
    ## BASIC COMMANDS
    
    # main menu
    "menu")
        title "CHOOSE AN OPTION:"
        runMainMenu "$@"
        exit
    ;;

    # new project
    "new"|"--new"|"-n")
        runCreateNewProject "$@"
        exit
    ;;

    # add a stack to an existing project
    "add"|"--add"|"-a")
        runAddAnStack "$@"
        exit
    ;;

    "help"|"--help"|"-h")
        showHelp
        exit
    ;;
    
    ###################
    ## WHEN INVALID COMMAND
    *)
        exception_command "$@"
    ;;
    
esac

showHelp
