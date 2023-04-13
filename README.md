#  nebula-net

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
- automatically create new certificates for nodes due to expire within the next
  3 months
    - later make this interval configurable

### Goal

Produce an accompanying ansible role that can work with the inventory generated
to:

- install nebula client on each machine
- install nebula using local IP so you can be at home and use the LAN address of
  a machine (e.g., your laptop) `192.168.1.20` and set it up as a nebula node
- update certificates on each node

Envisioned usage is shown below

```bash
dir=$HOME/.local/bin
ansible-playbook -K -i $dir/nebula-net                    install-nebula.yml
ansible-playbook -K -i $dir/nebula-net                    update-certs.yml

ansible-playbook -K -i $dir/nebula-net --limit homeserver add-local.yml
```

## Getting Going

This project began with my [super-python-project-template][template] and you can
[read more][how] to learn how it works.

### Source of Truth

This project is available on [GitHub][github] and [GitLab][gitlab]. Each push to
`master` automatically goes to both so choose whichever platform you prefer.

[github]: <https://github.com/gikeymarcia/nebula-net>
"nebula-net @ GitHub"
[gitlab]: <https://gitlab.com/gikeymarcia/nebula-net>
"nebula-net @ GitLab"
[how]: <https://github.com/gikeymarcia/super-python-project-template/blob/master/docs/00-how_it_works.md>
"How it Works"
[template]: <https://gitlab.com/gikeymarcia/super-python-project-template>
"super-python-project-template @ GitLab"
