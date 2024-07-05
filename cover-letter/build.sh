#!/bin/zsh

function run() {
    autoload colors; colors

    if ! type "inkscape" > /dev/null; then
        brew install inkscape
    fi

    if ! type "chronic" > /dev/null; then
        brew install moreutils
    fi

    local files=$(find ./*.tex)

    echo $files | while read -r file _; do
        echo "building: $file"
        # chronic will suppress terminal noise unless the build fails
        chronic pdflatex --shell-escape -output-directory ./artifacts $file
    done

    echo -n "cleaning up sub-artifacts... "
    rm artifacts/*.log artifacts/*.aux artifacts/*.out
    echo "$fg[green]done$reset_color"
}

run
