#!/bin/sh

mkdir -p ./artifacts
pdflatex -output-directory ./artifacts ./amcnamara_cv.tex

UPDATE_MATCH="s/(last updated:)([^\)]*)/\1 $(date '+%B %d, %Y at %H:%M %Z')/g"
sed -i.bu -E "$UPDATE_MATCH" ./README.md
rm ./README.md.bu
