# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH:/usr/local/go/bin:$HOME/go/bin:$PATH"
fi
export PATH

# User specific aliases and functions

# gpg shell variables
export GPG_TTY=$(tty)

# python virtualenvwrapper
export WORKON_HOME=~/.envs
source $HOME/.local/bin/virtualenvwrapper_lazy.sh

# alias for authenticating with kerberos
alias kinitme=~/.scripts/kinit.sh

# alias to provision node in openstack
alias create-osp-node="~/.scripts/create-osp-node.sh"

# alias to destroy node in openstack
alias delete-osp-node="~/.scripts/delete-osp-node.sh"

export ANSIBLE_VAULT_PASSWORD_FILE=""

# checkout pull requests from GitHub projects (need to be at root of project)
# input: pull request id
function checkout_pr() {
    git fetch origin pull/$1/head:PR-$1
    git checkout PR-$1
}
