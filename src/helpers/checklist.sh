#!/bin/bash

function run_checklist()  # selected_items, ...menu_items
{
    local selected_item="0"

    local menu_items=("$@")
    local menu_size="${#menu_items[@]}"
    local menu_limit="$menu_size"

    tput civis # invisible cursor
    tput sc # save cursor

    print_checklist "$selected_item" "${menu_items[@]}"

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

                    tput rc # restore cursor
                    tput el # erase to end of line
                    print_menu "$selected_item" "${menu_items[@]}"
                fi
                ;;
            "")  # Enter key
                if [[ "$selected_item" = "$menu_limit" ]]
                then
                    tput cnorm # normal state cursor
                    export CHECKEDS
                    return $?
                else
                    if [[ "${CHECKEDS[*]}" =~ $selected_item ]]
                    then
                        CHECKEDS=("${CHECKEDS[@]/$selected_item}") 
                    else
                        CHECKEDS+=" $selected_item"
                    fi 

                    tput rc # restore cursor
                    tput el # erase to end of line
                    print_menu "$selected_item" "${menu_items[@]}"
                fi
                ;;
        esac
    done
}

function print_checklist()  # selected_item, ...menu_items
{
    local function_arguments=("$@")

    local selected_item="$1"
    local menu_items=(${function_arguments[@]:1})

    local menu_size="${#menu_items[@]}"

    for (( i = 0; i < "$menu_size"; ++i ))
    do
        if [[ "$i" = "$selected_item" ]]
        then
            if [[ " ${CHECKEDS[*]} " =~ $i ]]
            then
                printf "%b> [x] %s%b \n" "$COL_CYAN" "${menu_items[i]}" "$COL_RESET"
            else
                printf "%b> [ ] %s%b \n" "$COL_CYAN" "${menu_items[i]}" "$COL_RESET"
            fi
        else
            if [[ " ${CHECKEDS[*]} " =~ $i ]]
            then
                printf "  [x] %s \n" "${menu_items[i]}"
            else
                printf "  [ ] %s \n" "${menu_items[i]}"
            fi
        fi
    done

    if [[ "$menu_limit" = "$selected_item" ]]
    then
        printf "%b> Done%b \n" "$COL_CYAN" "$COL_RESET"
    else
        printf "  Done \n"
    fi
}
