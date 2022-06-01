#!/bin/bash

runCheckEngineering() {
    if [[ ! -d "${CKL_PATH}/engineering" ]]; then
        runCloneEngineering
    else
        runUpdateEngineering
    fi
}

runCloneEngineering() {
    cd "${CKL_PATH}" || exception_unexpected
    step "Cloning engineering repository"

    printf "%b" "$COL_LGRAY"
    git clone "${ENGINEERING_BRANCH}"
    printf "%b" "$COL_RESET"

    if [[ ! -d "${CKL_PATH}/engineering" ]]; then
        exception_ssh "engineering"
    fi
}

runUpdateEngineering() {
    cd "${CKL_PATH}/engineering" || exception_unexpected
    step "Updating engineering repository"

    printf "%b" "$COL_LGRAY"
    git pull origin main
    printf "%b \n" "$COL_RESET"
}
