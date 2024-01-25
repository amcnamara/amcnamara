#!/bin/sh

mkdir -p ./artifacts
pdflatex -output-directory ./artifacts ./amcnamara_cv.tex

VERSION_MATCH="s/VERSION:.*/VERSION: $(date)/g"
sed -i.bu "$VERSION_MATCH" ./README.md
rm ./README.md.bu
