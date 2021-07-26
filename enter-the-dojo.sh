#!/usr/bin/env bash
# Mikey Garcia, @gikeymarcia
# Meant to be sourced before returning to development

activate=".venv/bin/activate"
if [ -f "$activate" ]; then
    figlet "enter the dojo"
    ls -l
    source "$activate"
    python -m pip install -r ./requirements_dev.txt
    python -m pip list
else
    echo "Could not find venv activator at $activate"
fi
