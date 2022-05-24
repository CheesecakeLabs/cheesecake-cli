#!/bin/bash

CKL_REPOSITORY="$HOME/.ckl"
CKL_BIN="/opt/homebrew/bin/ckl"

# UNAME_MACHINE="$(/usr/bin/uname -m)"

# if [[ "${UNAME_MACHINE}" == "arm64" ]]
# then
#   # On ARM macOS, this script installs to /opt/homebrew only
#   CKL_BIN="/opt/ckl"
# else
#   # On Intel macOS, this script installs to /usr/local only
#   CKL_BIN="/usr/local/ckl"
# fi

printf "%bInstalling %bCKL%b globally:%b\n"  "$COL_GREEN"  "$COL_YELLO" "$COL_GREEN" "$COL_RESET"
printf "The %bsudo%b password can be asked.\n\n" "$COL_CYAN" "$COL_RESET"
sleep 1

ln -sf "$CKL_REPOSITORY/bin" "$CKL_BIN"
sudo chmod +rx "$CKL_BIN"

printf "%b\n\nCKL is installed!%b\n\n" "$COL_CYAN" "$COL_RESET"
printf "%b\n\nNow you can use ckl command directly from your terminal. !%b\n\n" "$COL_CYAN" "$COL_RESET"
