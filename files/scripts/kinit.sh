#!/bin/bash

# script to obtain a new kerberos ticket for the current user

# how to generate a new keytab
#   1. ktutil
#   2. addent -password -p <username>@<REALM> -k 1 -e aes256-cts
#   3. wkt <username>.keytab
#   4. exit

# set key tab absolute path
key_tab="$HOME/.static/$USER.keytab"

# obtain kerberos ticket via key tab
kinit $USER -k -t $key_tab

# list kerberos tickets
klist
