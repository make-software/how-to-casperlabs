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
    src/aws/setup-testnet-validator-from-scratch.md
    src/ubuntu/setup-testnet-validator-from-scratch.md
    src/faq-user.md
    src/faq-validator.md
    src/testnet.md
    src/testnet-rewards.md
    src/testnet/testnet-upgrades.md
    src/testnet/upgrade-1_1_0.md
    src/testnet/upgrade-1_1_2.md
    src/testnet/upgrade-1_2_0.md
    src/testnet/upgrade-1_2_1.md
    src/testnet/upgrade-1_3_1.md
    src/testnet/upgrade-1_3_2.md
    src/testnet/upgrade-1_3_4.md
    src/testnet/upgrade-1_4_1.md
    src/testnet/upgrade-1_4_2.md
    src/testnet/upgrade-1_4_3.md
    src/testnet/upgrade-1_4_4.md
    src/testnet/upgrade-1_4_5.md
    src/testnet/upgrade-1_4_6.md
    src/testnet/upgrade-1_4_7.md
    src/testnet/upgrade-1_4_8.md
    src/testnet/upgrade-1_4_10.md
    src/testnet/upgrade-1_4_13.md
    src/user-guides/SignerGuide.md
    src/user-guides/Connect-a-Wallet.md
    src/user-guides/Transfer-CSPR.md
    src/user-guides/Delegating-CSPR-Stake.md
    src/user-guides/Undelegating-CSPR-Stake.md
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
