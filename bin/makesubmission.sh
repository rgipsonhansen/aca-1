#! /usr/bin/env sh

PROJECT_NAME=project1

if ! [[ -f README.md ]]; then
    echo "This script MUST be run from the same directory as README.rst" 1>&2
    exit 1
fi
printf "Enter your MultiPass username: "
read username
filename="${username}-${PROJECT_NAME}.tar.gz"
tmpdir=$(mktemp -d)
tar --exclude-vcs-ignores \
    --exclude-vcs \
    --exclude .editorconfig \
    --exclude .envrc \
    --exclude .gitignore \
    --exclude .vim \
    --exclude bin \
    --exclude cachesim \
    --exclude expected \
    --exclude inputs \
    --exclude README.md \
    --exclude setup.cfg \
    --exclude shell.nix \
    --exclude test_results \
    -jcf ${tmpdir}/${filename} .
mv ${tmpdir}/${filename} .
echo "${filename} created with the following files:"
tar tf ${filename}
