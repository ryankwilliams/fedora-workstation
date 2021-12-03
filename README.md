# Fedora Workstation Setup

A repository which automates the deployment of my fedora workstation based
on my preferences by using ansible.

## Getting Started

On a fresh installation of fedora workstation, I would first install `git` and
`ansible`. The minimal version of ansible tested with this playbook is
version `>=2.5`.

```shell
sudo dnf install -y ansible git
```

Once both dependencies are installed, at the root of this repository is a
playbook named `workstation.yml`. Running this playbook will run through all
configuration to configure my fedora workstation.

```shell
ansible-playbook workstation.yml
```
