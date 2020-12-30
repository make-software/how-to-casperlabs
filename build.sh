#!/bin/bash

function readAndResolveIncludes() {
    while IFS= read -r line
    do
        if [[ "$line" =~ ^\[include.*\]$ ]]
        then
            include_file=(`echo "${line#[include}"`)
            include_file=(`echo "${1%/*}/${include_file%]}"`)
            readAndResolveIncludes "$include_file"
        else
            echo "$line"
        fi
    done < $1
}

rm -rf docs/*

#files=($(find src -type f -name '*.md'))
files=(
    src/aws/setup-validator-from-scratch.md
    src/ubuntu/setup-validator-from-scratch.md
    src/ubuntu/update-validator.md
    src/faq.md
)

for file in ${files[*]}
do
    outfile="docs/${file#src/}"
    outdir=${outfile%/*}

    mkdir -p "${outdir}"
    touch "${outfile}"

    printf "   %s > %s\n" $file $outfile

    readAndResolveIncludes "$file" > $outfile
done
