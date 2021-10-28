#!/usr/bin/env bash
# Mikey Garcia, @gikeymarcia
# Pass package name and update referecnes throughout the project
# Intended for use when beginning a new package
# Will also clean the repo of ignored files

# set -x

if [ -n "$1" ]; then
    name=$1

    # place package name into setup.py
    new_setup=$(mktemp)
    sed "s/package_name/${name}/" setup.py > "$new_setup"
    mv -vf "$new_setup" setup.py

    # rename module directory
    mv -v ./package "./${name}"

    # place package name into .bumpversion.cfg
    bumpversion=$(mktemp)
    sed "s/package/${name}/" .bumpversion.cfg > "$bumpversion"
    mv -vf "$bumpversion" .bumpversion.cfg

    # clean ignored files + show directory state
    git add "${name}"
    git clean -dxf
    git add .
    git status
    git diff .bumpversion.cfg
    git diff setup.py
    tree -a -I ".git"
else
    echo "No name given. No changes will be made."
fi
