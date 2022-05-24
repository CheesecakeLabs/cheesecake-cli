#!/bin/bash

function restore_saved_cursor() {
    tput rc # restore cursor
    tput el # erase to end of line
    tput sc # save cursor
}

function reset_original_cursor() {
    tput cnorm
    tput reset
}
