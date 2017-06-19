# Environment

To build your develop environment gracefully.

## Requirements

* Master Machine
    * ansible (version >= 2.3)

* Slave Machine (Which you want to build your environment)
    * openssh-server
    * Master machine accessible

> Of course, you can build environment in master machine locally.

## Usage

```bash
git clone github.com/aweimeow/environment
cd environment
```

#### Configuration File

If there is many slave machines going to install, you can write in **hosts** file. 
Take a look at `hosts` or following is an example configuration.

```
# 
[all:vars]
ansible_connection=ssh
ansible_ssh_user=<your_username>
ansible_ssh_pass=<your_password>

# And put ip addresses at here.
[targets]
172.17.0.2
```

#### Execute all tasks Ansible Playbook

Slave machine not include localhost must be access by private-key or password.

```bash
ansible-playbook main.yml -i hosts
```

#### Execute only some tasks in Ansible Playbook

We have 4 tags for different proposals: `server`, `terminal`, `editor`, `desktop`. 

* `server` tag: Target machine is a server, without desktop environment, install `setup_basic.yml`, `setup_terminal.yml` and `setup_editor.yml`.
* `terminal` tag: Only install `setup_terminal.yml`, use it when you only need terminal customization.
* `editor` tag:  Only install `setup_editor.yml`, use it when you only need editor(vim) customization.
* `desktop` tag:  Only install `setup_desktop.yml`, if you want to install environment in brand new Ubuntu Desktop, do not specific any tag.

```bash
# When you specific 1 tag
ansible-playbook main.yml -i hosts --tags editor
# When you specific multiple tags
ansible-playbook main.yml -i hosts --tags terminal,editor
```

## How to custom my playbook ?

In this project, I split develop enviroment installation to 3 part. 

1. Basic Installation
    * apt: variable in `vars/server`
2. Terminal Customization (Plugin like: powerline, syntax highlightin, ...)
    * git: variablein `vars/terminal`
3. Editor Configuration
    * editor installation step in `tasks/setup_editor.yml`

Besides, I use Ubuntu 14.04.5, and package manager on Ubuntu is `apt`, 
if you want modify to fit other operating system, 
you can found more info in [Packaging Modules - Ansible](http://docs.ansible.com/ansible/list_of_packaging_modules.html#os).

## License

Licensed under the [MIT license](LICENSE.txt).