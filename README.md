# Fedora Workstation Setup

A repository which automates the deployment of my fedora workstation based
on my preferences by using ansible.

## Getting Started

On a fresh install of fedora workstation, I would first install `git` and
`ansible`. The minimal version of ansible tested with this playbook is
version `>=2.5`.

```
$ sudo dnf install -y ansible git
```

Once both dependencies are installed, at the root of this repository is a
playbook named `workstation.yml`. Running this playbook will run through all
configuration to configure my fedora workstation.

```
$ ansible-playbook workstation.yml
```

Most ansible tasks I created have been tagged. This allows me to easily run
certain configuration (as needed).

```
$ ansible-playbook workstation.yml --tag <tag-name>
```

## Available Tags

**initialize** - This tag will run all initialization tasks. This consist of
removing unused applications, setting dnf repositories, etc.

**remove-packages** - This tag will remove unused applications.

**add-repos** - This tag will add dnf repositories to the system.

**add-chrome-repo** - This tag will add Google Chrome repository to the
system.

**add-vscode-repo** - This tag will add Visual Studio Code repository to
the system.

**add-docker-ce-repo** - This tag will add docker ce repository to the
system.
