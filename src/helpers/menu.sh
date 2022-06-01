#!/bin/bash

function run_menu()  # selected_item, ...menu_items
{
    local selected_item="0"

    local menu_items=("$@" "EXIT")
    local menu_size="${#menu_items[@]}"
    local menu_limit=$((menu_size - 1))

    save_cursor
    print_menu "$selected_item" "${menu_items[@]}"

    while read -rsn1 input
    do
        case "$input"
        in
            $'\x1B')  # ESC ASCII code (https://dirask.com/posts/ASCII-Table-pJ3Y0j)
                read -r -sn1 input
                if [ "$input" = "[" ]  # occurs before arrow code
                then
                    read -r -sn1 input

                    case "$input"
                    in
                        A)  # Up Arrow
                            if [ "$selected_item" -ge 1 ]
                            then
                                selected_item=$((selected_item - 1))
                            else
                                selected_item="$menu_limit"
                            fi
                            ;;
                        B)  # Down Arrow
                            if [ "$selected_item" -lt "$menu_limit" ]
                            then
                                selected_item=$((selected_item + 1))
                            else
                                selected_item="0"
                            fi
                            ;;
                    esac

                    restore_cursor
                    save_cursor

                    print_menu "$selected_item" "${menu_items[@]}"
                fi
                ;;
            "")  # Enter key

                if [ "$selected_item" == "$menu_limit" ]; then
                    quit "Command ended!"
                    exit
                fi

                export SELECTED="$selected_item"
                return $?
                ;;
        esac
    done
}

function print_menu()  # selected_item, ...menu_items
{
    local function_arguments=("$@")

    local selected_item="$1"
    local menu_items=(${function_arguments[@]:1})

    local menu_size="${#menu_items[@]}"

    for (( i = 0; i < "$menu_size"; ++i ))
    do
        if [ "$i" = "$selected_item" ]; then
            if [ "${menu_items[i]}" == "EXIT" ]; then
                printf " %b> EXIT%b" "$COL_RED" "$COL_RESET"
            else
                printf " %b> %s%b \n" "$COL_CYAN" "${menu_items[i]}" "$COL_RESET"
            fi
        else
            if [ "${menu_items[i]}" == "EXIT" ]; then
                printf " . EXIT"
            else
                printf " . %s \n" "${menu_items[i]}"
            fi
        fi
    done
}
