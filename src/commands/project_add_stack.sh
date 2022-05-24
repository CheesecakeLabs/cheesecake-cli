#!/bin/bash

runAddAnStack() {
    checkProject "$1"
    shift 1

    checkStarter "$1"
    shift 1

    if [[ -z "$PROJECT" ]] || [[ -z "$STARTER" ]]; then
        exception_arguments
    fi

    project_path="${PROJECTS_PATH}/${PROJECT}"

    ask "Rename ${STARTER} slug:"
    read -r stack_name
    stack_slug=$(echo "$stack_name" | iconv -t ascii//TRANSLIT | sed -r s/[~\^]+//g | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)

    cd "${project_path}" || exception_random

    mkdir "$stack_slug"
    cp -r "$CKL_PATH"/engineering/starters/"$STARTER"/. ./"$stack_slug"

    git add .
    git commit -m "feat: add '${STARTER}' starter"

    return $?
}
