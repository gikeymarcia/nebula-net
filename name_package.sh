#!/usr/bin/env bash
# Mikey Garcia, @gikeymarcia
# Pass package name and update referecnes throughout the project
# Intended for use when beginning a new package

if [ -n "$1" ]; then
    name=$1

    new_setup=$(mktemp)
    sed "s/package_name/$name/" setup.py > "$new_setup"
    mv -vf "$new_setup" setup.py

    mv -v ./package "./$name"

    bumpversion=$(mktemp)
    sed "s/package/$name/" .bumpversion.cfg > "$bumpversion"
    mv -vf "$bumpversion" .bumpversion.cfg
    git status
    tree -a -I "env|.git"
else
    echo "No name given. No changes will be made."
fi
