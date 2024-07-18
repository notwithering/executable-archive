#!/bin/bash
stty raw -echo
while read -rsn1 char; do
    case "$char" in
        [[:upper:]] | [[:lower:]]) echo "You pressed a letter: $char";;
        ' ') echo "You pressed space.";;
        $'\t') echo "You pressed tab.";;
        $'\177') echo "You pressed backspace.";;
        '') echo "You pressed enter.";;
        $'\e') echo "You pressed escape.";;
        *) echo "You pressed $char.";;
    esac
done
stty -raw echo

