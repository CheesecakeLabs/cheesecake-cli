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

    "help"|"--help"|"-h")
        showHelp
        exit
    ;;

    ###################
    ## PROJECT COMMANDS

    # new project
    "new"|"--new"|"-n")
        runCheckEngineering
        runCreateNewProject "$@"
        exit
    ;;

    # add a stack to an existing project
    "add"|"--add"|"-a")
        runCheckEngineering
        runAddAnStack "$@"
        exit
    ;;

    ###################
    ## INSTALL UTILS

    # run main install
    "utils"|"--utils"|"-u")
        if [[ $1 == "install" ]]; then
            shift 1
        fi
        
        runInstallUtils "$@"
        exit
    ;;

    ###################
    ## WHEN INVALID COMMAND
    *)
        exception_command "$@"
    ;;
    
esac

showHelp
