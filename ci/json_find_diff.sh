#!/bin/bash
file="$TRAVIS_BUILD_DIR/ci/tmp.txt"
while IFS= read -r line
do
    jq --indent 4 -S . $line | cmp $line -
done <"$file"
