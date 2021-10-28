#!/usr/bin/env bash
# build a release of the project for upload to PyPi
# Mikey Garcia, @gikeymarcia
# http://github.com/gikeymarcia/pyProjectTemplate

set -e

# enter development environment
source ./enter-the-dojo.sh

# remove old builds
rm -rf ./build/
rm -rf ./dist/

# build source archive and wheel
python ./setup.py sdist bdist_wheel

# display tar contents
tar tzf dist/*tar.gz

# check render on PyPi
twine check dist/*

choice="$1"
if [ -z "$choice" ]; then
    echo "choose either: 'test' or 'pypi' to upload build."
    exit 1
elif [ "$choice" == "test" ]; then
    # upload to test.pypi.org
    twine upload --repository-url https://test.pypi.org/legacy/ dist/*
elif [ "$choice" == "pypi" ]; then
    # to upload to PyPi
    twine upload dist/*
fi

