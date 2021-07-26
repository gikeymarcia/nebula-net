#!/usr/bin/env bash
# Mikey Garcia, @gikeymarcia

env=./.venv
if [ -d $env ]; then
    echo "deleting old environment"
    rm -rf $env
fi
# python -m pip install --user virtualenv
python -m venv $env
