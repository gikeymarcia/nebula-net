#!/usr/bin/env bash
# Mikey Garcia, @gikeymarcia

function _bump_version () {
    local part="$1" # major minor patch
    if [ -n "$part" ]; then
        _print_banner "Bump Package Version"
        bump2version "$part"
        git log --oneline -n 5
    else
        echo -e "Must provide which part to bump:\nmajor minor patch"
    fi
}

function _rm_virtual_env () {
    local venv_dir="$1"
    _print_banner remove virtual env
    if [ -d  "$venv_dir" ]; then
        rm -rv "$venv_dir"
    fi
}

function _clean_environment() {
    local venv_dir="$1"
    _rm_virtual_env "$venv_dir"
    create_venv "$venv_dir"
    _enter_the_dojo "$venv_dir"
}

function _enter_venv() {
    local venv_dir="$1"
    local activator="${venv_dir}/bin/activate"
    if [ ! -f "$activator" ]; then
        echo "Could not find activator at ${activator}"
    else
        _print_banner enter the dojo
        source "$activator"
    fi
}

function _install_requirements() {
    _print_banner install development requirements
    python -m pip install --upgrade pip
    python -m pip install -r ./requirements_dev.txt
    python -m pip list
}

function _enter_the_dojo(){
    local venv_dir="$1"
    _enter_venv "$venv_dir"
    _install_requirements
}

function _print_banner() {
    figlet "$@" | lolcat
    sleep 0.4
}

function create_venv (){
    _print_banner create virtual env
    $(which python3) -m pip install --user virtualenv
    $(which python3) -m virtualenv "$1"
}

function _smart_loader () {
    # If the virtual environment isn't configured create it, otherwise enter
    local venv_dir="$1"
    [ ! -d "$venv_dir" ] && create_venv "$venv_dir"
    _enter_the_dojo "$venv_dir"
}

function _build_project () {
    local proj_dir="$1"
    local venv_dir="$2"
    local build_type="$3"
    _clean_environment "$venv_dir"
    # remove old builds
    rm -rv "${proj_dir}/build" && rm -rv "${proj_dir}/dist"
    python ./setup.py sdist bdist_wheel     # build source archive and wheel
    tar tzf dist/*tar.gz                    # display tar contents
    twine check dist/*                      # check render on PyPi

    if [ -z "$build_type" ]; then
        echo "choose either: 'test' or 'pypi' to upload build."
    elif [ "$build_type" == "test" ]; then
        # upload to test.pypi.org
        twine upload --repository-url https://test.pypi.org/legacy/ dist/*
    elif [ "$build_type" == "pypi" ]; then
        # to upload to PyPi
        twine upload dist/*
    fi
}

function _continuous_testing() {
    _print_banner "Test Driven Development!"
    python -m pytest -v "$1"
    while true; do
        fdfind -e py | entr -rndp python -m pytest -v "$1"
        sleep 0.5
    done
}

clear
# Set important variables then use _smart_loader
virtual_env_dir=$(realpath "./env")
project_dir=$(realpath ".")
_smart_loader "$virtual_env_dir"

function dojo () {
    if [ -z "$1" ]; then
        echo -e "COMMANDS:\n"
        echo new -- create a clean new development virtual environment
        echo req -- install requirements into current environment
        echo smart -- run the smart loader for quickest development
        echo test -- run continuous test driven development using pytest
        echo bump PART -- bump version of package. Opts: major minor patch
        echo build -- make a build and check it for pypi render
        echo build test -- make a build and upload it to test.pypi.org
        echo build pypi -- make a build and upload it to pypi.org
    elif [ "$1" == "new" ]; then
        _clean_environment "$virtual_env_dir"
    elif [ "$1" == "req" ]; then
        _enter_venv "$virtual_env_dir" && _install_requirements "$virtual_env_dir"
    elif [ "$1" == "smart" ]; then
        _smart_loader "$virtual_env_dir"
    elif [ "$1" == "test" ]; then
        _continuous_testing "$project_dir"
    elif [ "$1" == "bump" ]; then
        local part="$2"     # opts: major minor patch
        _bump_version "$part"
    elif [ "$1" == "build" ]; then
        local action="$2"   # opts: test pypi
        _build_project "$project_dir" "$virtual_env_dir" "$action"
        # dojo build test
        # dojo build pypi
    fi
}

