#!/bin/bash

function save_cursor() {
    tput sc # save cursor
    tput civis # invisible cursor
}

function restore_cursor() {
    tput rc # restore cursor
    tput el # erase to end of line
}

function reset_cursor() {
    tput cnorm
}
