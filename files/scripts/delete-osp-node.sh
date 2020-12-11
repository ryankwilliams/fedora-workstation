#!/usr/bin/bash

<<DOCSTRING
Bash shell script demonstrating how to teardown an instance using the
OpenStack client cli.

The following environment variables MUST be set for authentication. These can
easily be set by sourcing the OpenStack RC file you downloaded from your
OpenStack tenant.

export OS_IDENTITY_API_VERSION=
export OS_AUTH_URL=
export OS_DEFAULT_DOMAIN=
export OS_USERNAME=
export OS_PASSWORD=
export OS_PROJECT_NAME=

source openrc.sh
DOCSTRING

# import helper functions
source ~/.scripts/helper.sh --source-only

# required authentication environment variables
REQUIRED_ENV_VARS=(
    OS_IDENTITY_API_VERSION
    OS_AUTH_URL
    OS_USER_DOMAIN_NAME
    OS_USERNAME
    OS_PASSWORD
    OS_PROJECT_NAME
	  INSTANCE_NAME
)

# quit if required environment variables not found
for var in ${REQUIRED_ENV_VARS[@]}; do
    if [[ ! -v $var ]]; then
        log "Environment variable: ${var} not set."
        exit 1
    fi
done

# define variables
# readonly SERVER="kingbob"

log "Delete launched instance.."

# delete a server
openstack server delete $INSTANCE_NAME

log "Request to delete launched instance was successful!"
