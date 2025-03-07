#!/bin/zsh

function run() {
    autoload colors; colors

    if ! type "inkscape" > /dev/null; then
        brew install inkscape
    fi

    if ! type "chronic" > /dev/null; then
        brew install moreutils
    fi

    # Shouldn't be necessary to manually convert vector graphics
    #local vectors=$(find ./graphics/*.svg)
    #echo $vectors | while read -r vector _; do
    #    echo "converting: $vector to PDF"
    #    inkscape $vector --export-type=pdf --export-latex
    #done

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
