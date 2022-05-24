#!/bin/bash

bootstrapping() {
    str="$(find ./src/"$1" -type f -name '*.sh' -print)"
    
    for file in $str; do
        [[ -f $file ]] && . "$file" --source-only || echo "$file not found"
    done
}

source ./.env

bootstrapping 'configs/'
bootstrapping 'helpers/'
bootstrapping 'commands/'

# checkBin() {
#     if ! exists ckl; then
#         printf "%bInstalling %bCKL%b globally:%b\n"  "$COL_GREEN"  "$COL_YELLO" "$COL_GREEN" "$COL_RESET"
#         printf "The %bsudo%b password can be asked.\n" "$COL_CYAN" "$COL_RESET"
#         sleep 1
        
#         ln -sf "$CKL_PATH/bin" "$BIN_PATH"
#         sudo chmod +rx "$BIN_PATH"
        
#         printf "%b\n\nCKL is installed!%b\n\n" "$COL_CYAN" "$COL_RESET"
#         printf "%b\n\nNow you can use ckl command directly from your terminal. !%b\n\n" "$COL_CYAN" "$COL_RESET"
#     fi
# }

# checkBin