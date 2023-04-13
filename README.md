---
author: Mikey Garcia, @gikeymarcia
date: 2023-04-13 03:31
title: nebula-net
---

A python module to facilitate the creation and mangement of nebula network
certificates.

### Features

- As-is this is in the early phases but is coming together quickly. Currently
  you run the module in an empty folder

    ```bash
    python -m nebula-net
    ```
  and it prompts you to name your network (if one doesn't exist) then creates
  the root certificate. If a certificate exists it shows informatoin about it.

### TODO

- If no node is found, ask for input to generate first nebula node certificate
- If nodes are found, be able to scan for them and display informatoin

### mid-range

- Be able to add a 'name','local_address', and 'nebula_address' for a
  node

  ```yaml
  - name: "homeserver"
    local_address: "192.168.1.12"
    nebula_address: "10.0.0.30/24"
  ```

- Be able to run this module in a script that'll produce an output appropriate
  for an ansible inventory

### Goal

Produce an accompanying ansible role that can work with the inventory generated
to:

-

  ```bash
  dir=$HOME/.local/bin
  ansible-playbook -K -i $dir/nebula-net                    install-nebula.yml
  ansible-playbook -K -i $dir/nebula-net                    update-certs.yml

  ansible-playbook -K -i $dir/nebula-net --limit homeserver add-local.yml
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
