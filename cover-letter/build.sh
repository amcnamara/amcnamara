#!/bin/zsh

function run() {
    if ! type "inkscape" > /dev/null; then
        brew install inkscape
    fi

    local files=$(find ./*.tex)

    echo $files | while read -r file _; do
        echo "building: $fg[yellow]$file$reset_color"
        pdflatex --shell-escape -output-directory ./artifacts $file
    done

    echo -n "cleaning up sub-artifacts... "
    rm artifacts/*.log artifacts/*.aux artifacts/*.out
    echo "$fg[green]done$reset_color"
}

run
