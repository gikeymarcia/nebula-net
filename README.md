# Super Python Project Template

Starter template to quickly go from idea to fully functional Python3 virtual
development environment. Includes hooks for continuous test driven development.

### Features

- Quick development environment boot strap with `source ./tools.sh`
- Continuous test driven development with `dojo test`
- Pre-configured `setup.py`
- Pre-configured [`bump2version`][bump2version]

## Pre-requisites

#### Debian & Ubuntu

```bash
sudo apt install -y python3 python3-pip fd-find entr tar figlet lolcat
```

That above command can also be run with `./scripts/install_system_packages.sh`

## Getting Going

You come up with a great idea for implementing artificial general intelligence
and decide you need to get coding quickly.

1. Clone the template: `git clone https://github.com/gikeymarcia/super-python-project-template.git`
2. Configure template with your package name `./scripts/name_package.sh agi`
3. Run smart development boot strap `source ./tools.sh`
4. Try out the new function `dojo` to work with your project's environment
    - `dojo` -- see the help message
    - `dojo new` -- delete old environment and recreate clean
    - `dojo req` -- reinstall latest requirements from `./requirements_dev.txt`
    - `dojo test` -- run continuous testing using pytest
    - `dojo bump PART` -- bump package version number: __major minor patch__
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


## Going Deeper

Although nascent, I've began outlining how this tool works in [the
`/docs`][how]. I want to put the power in your hands to take what I've started
and make it your own then pay it forward.

### Source of Truth

This project is available on [GitHub][github] and [GitLab][gitlab]. Each push to
`master` automatically goes to both so choose whichever platform you prefer.

[gitlab]: <https://gitlab.com/gikeymarcia/super-python-project-template>
"super-python-project-template @ GitLab"
[github]: <https://github.com/gikeymarcia/super-python-project-template>
"super-python-project-template @ GitHub"
[bump2version]: <https://github.com/c4urself/bump2version#usage>
"c4urself/bump2version: Usage"
[how]: <https://github.com/gikeymarcia/super-python-project-template/blob/master/docs/00-how_it_works.md>
"How it Works"
