#!/bin/bash

runCreateNewProject() {
    if [[ -z "$1" ]]; then
        ask "Customer name:"
        read -r customer
    else
        customer="$1"
        shift 1
    fi

    if [[ -z "$1" ]]; then
        ask "Project name:"
        read -r project
    else
        project="$1"
        shift 1
    fi

    customer_slug=$(echo "$customer" | iconv -t ascii//TRANSLIT | sed -r s/[~\^]+//g | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)
    project_slug=$(echo "$project" | iconv -t ascii//TRANSLIT | sed -r s/[~\^]+//g | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)

    project_name="${customer_slug}-${project_slug}"
    project_path="$PROJECTS_PATH"/"$project_name"

    if [ -d "$project_path" ]; then
        exception_message "Error trying to create a project with a name that already exists."
    fi

    mkdir "$project_path"
    cp -r "$CKL_PATH"/engineering/monorepo/. "$project_path"
    cd "$project_path" || exception_unexpected

    git init --initial-branch="$MAIN_BRANCH"
    git config user.name "$GIT_NAME"
    git config user.email "$GIT_EMAIL"

    git add .
    git commit -m "Create project '${project}' for customer '${customer}'."

    return $?
}
