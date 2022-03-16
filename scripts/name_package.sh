#!/usr/bin/env bash
# Mikey Garcia, @gikeymarcia
# Pass package name and update references throughout the project
# Intended for use when beginning a new package
# Will also clean the repo of ignored files

set -x

if [ -n "$1" ]; then
    name=$1

    # place package name into setup.py
    new_setup=$(mktemp)
    sed "s/package_name/${name}/" setup.py > "$new_setup"
    mv -f "$new_setup" setup.py

    # place package name into .bumpversion.cfg
    new_bumpversion=$(mktemp)
    sed "s/package/${name}/" .bumpversion.cfg > "$new_bumpversion"
    mv -f "$new_bumpversion" .bumpversion.cfg

    # rename module directory
    mv -v ./package "./${name}"
    git add "${name}"

    # clean ignored files + show directory state
    git clean -dxf
    tree -a -I ".git"
    printf  "%s\n" "----------------------------------------"
    git add .
    git diff --staged -- .bumpversion.cfg
    git diff --staged -- setup.py
    printf  "%s\n" "----------------------------------------"
    git status
else
    echo "No name given. No changes will be made."
fi
