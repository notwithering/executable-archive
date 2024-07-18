#!/bin/bash

pagesleep=1
max_chars_per_page=255

function clicker {
    xdotool click 1
}

function typer {
    msg="$1"
    xdotool type "$msg"
}

printf 'Hover your mouse over the next page button.\n'
printf 'Waiting 5 seconds.\n\n'
sleep 5

mapfile -t lines < text.txt

current_chars=0
for line in "${lines[@]}"; do
    words=($line)
    word_count=${#words[@]}
    i=0
    while [ $i -lt $word_count ]; do
        current_word=${words[$i]}
        current_word_length=${#current_word}
        if [ $((page_length + current_word_length + 1)) -le 255 ]; then
            if [ $page_length -eq 0 ]; then
                typer "$current_word"
            else
                typer " $current_word"
            fi
            page_length=$((page_length + current_word_length + 1))
            i=$((i + 1))
        else
            clicker
            page_length=0
        fi
    done
    xdotool key Return
    page_length=0
done


