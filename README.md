# Python Project Template

Basic shell to begin a new project.

### Features

- `bump2version`
- `setup.py`
- continuous testing with `dojo test`
- quick development environment boot strap with `source ./tools.sh`

# Getting Going

1. Name your package; e.g., `agi`
2. Run `./scripts/name_package.sh agi`
3. Run smart development boot strap `source ./tools.sh`
4. Try out the new function `dojo` to work with your project's environment
    - `dojo` -- see the help message
    - `dojo new` -- delete old environment and recreate clean
    - `dojo req` -- reinstall latest requirements from `./requirements_dev.txt`
    - `dojo test` -- run continuous testing using pytest
    - `dojo build` -- make a build and check for rendering on pypi
    - `dojo build test` -- build project and release to **test.pypi.org**
    - `dojo build pypi` -- build project and release to **pypi.org**

## Useful Alias

```bash
export hax="source ./tools.sh"
```

After entering the project root run `hax` and you'll end up in a virtual
development environment with all of the packages from `./requirements.txt` and
`./requirements_dev.txt` installed.

When you realize your project needs a new packages you add it to the respective
requirements file and run `dojo req` to install the latest requirements. If
you'd like a clean slate environment rebuild with `dojo new`.
