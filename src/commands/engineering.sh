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

    git clone "${ENGINEERING_BRANCH}"

    if [[ ! -d "${CKL_PATH}/engineering" ]]; then
        exception_ssh "engineering"
    fi
}

runUpdateEngineering() {
    cd "${CKL_PATH}/engineering" || exception_unexpected
    step "Updating engineering repository"

    git pull origin main
}
