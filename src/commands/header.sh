#!/bin/bash

showHeader() {
    local width
    width=$(tput cols)

    if [ "$width" -gt 74 ]; then
        showBigHeader
    else
        showSmallHeader
    fi
}

showSmallHeader() {
    printf "%b \n" "$COL_CYAN"
    printf "  ____ _  ___       ____ _ _  \n"
    printf " / ___| |/ / |     / ___| (_) \n"
    printf "| |   | ' /| |    | |   | | | \n"
    printf "| |___| . \| |___ | |___| | | \n"
    printf " \____|_|\_\_____| \____|_|_| \n"
    printf "%b  -- - - - CheesecakeLabs Cli \n" "$COL_LGRAY"
    printf "%b \n\n" "$COL_RESET"
}

showBigHeader() {
    printf "%b \n" "$COL_CYAN"
    printf "  ____ _                                   _        _          _          \n"
    printf " / ___| |__   ___  ___  ___  ___  ___ __ _| | _____| |    __ _| |__  ___  \n"
    printf "| |   | '_ \ / _ \/ _ \/ __|/ _ \/ __/ _\` | |/ / _ \ |   / _\` | '_ \/ __| \n"
    printf "| |___| | | |  __/  __/\__ \  __/ (_| (_| |   <  __/ |__| (_| | |_) \__ \ \n"
    printf " \____|_| |_|\___|\___||___/\___|\___\__,_|_|\_\___|_____\__,_|_.__/|___/ \n"
    printf "%b  ---------------- - - - - - - - -  -  -  -  -  -  -  CheesecakeLabs Cli \n" "$COL_LGRAY"
    printf "%b \n\n" "$COL_RESET"
}
