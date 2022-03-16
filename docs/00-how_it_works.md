---
author: Mikey Garcia
date: 2022-03-16 13:10
title: Documentation
---

Hello and welcome to the party,

This project template began with the excellent [Real Python][real python]
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
cd "$project"
./scripts/name_package.sh automagic
source ./tools.sh

# add requirements
echo "pydymenu==0.5.2" >> requirements.txt
echo "Faker==13.3.2" >> requirements_dev.txt
# install new requirements
dojo req
```


## TODO

- Find requirements for other distros

- [ ] Arch
- [ ] Fedora

[bump2version]: <https://github.com/c4urself/bump2version#usage>
"c4urself/bump2version: Usage"
[real python]: <https://realpython.com/pypi-publish-python-package/#a-small-python-package>
"Structuring your Python Project"
