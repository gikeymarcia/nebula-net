# Python Project Template

A basic skeleton to begin a new python project.

If this is your first Python package I highly recommend you read the [Real 
Python][realpython] article on the topic. Much of what they cover is within this 
skeleton.

# Quickstart

Pick a name for your package, for example, `agi`

```bash
git clone $url my_project
cd my_project

./name_package.sh agi
./make-env.sh
source ./enter-the-dojo.sh
# protip: this alias rocks
alias dojo="source ./enter-the-dojo.sh"
```

### Features

- Automate the boilerplate! Get building now.
    - environment setup
    - continuous testing
    - making builds for PyPi
    - pushing releases
- pre-configured `bump2version` [_docs_][bump]
- pre-configured `setup.py`
- pre-configured `requirements_dev.txt` with
    - `pytest`
    - `mypy`
    - `black`
    - `bump2version`
    - `twine`

## Building your Environment

- Adding pip dependencies 
    - `requirements.txt` packages need at runtime
        - make sure to include the same list in `setup.py`: 
          `install_requires=[]`
    - `requirements_dev.txt` packages need to develop

### Using the Sripts

- create build environment with `make-env.sh`
- setup development env with `source ./enter-the-dojo.sh`

- create package virtual environment with - 

[bump]: <https://github.com/c4urself/bump2version#readme>
"bump2version on GitHub"
[realpython]: <https://realpython.com/pypi-publish-python-package/>
"How to publish an Open-Source Python Package to PyPi"
