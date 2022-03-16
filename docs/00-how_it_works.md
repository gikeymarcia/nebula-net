---
author: Mikey Garcia
date: 2022-03-16 13:10
title: Documentation
---

Hello and welcome to the party,

This project template began by following along with the excellent Real Python
guide on structuring a Python package. I implemented what I needed to get going
and collected all of that tooling here.

Over time I've expanded and automated this setup so I have a quick and reliable
way to boot strap myself into a highly functional development environment with
the most routine tasks automated and rolled up into the `dojo` helper function.

## Quick Start

```bash
project="$HOME/new-idea"
mkdir "$project"
git clone https://github.com/gikeymarcia/super-python-project-template.git "$project"
```


## TODO

The main missing component is a script to install the system packages needed for
sourcing './tools.sh'. Initially I'm targeting Debian-based distros but will
expand later.

#### Debian-based Dependencies

- `python3`
- `python3-pip`
- `fd-find`
- `entr`
- `figlet`
- `lolcat`
- `tar`

[bump2version]: <https://github.com/c4urself/bump2version#usage>
"c4urself/bump2version: Usage"
