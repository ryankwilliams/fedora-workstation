#!/usr/bin/bash

<<DOCSTRING
Bash shell script demonstrating how to provision an instance using the
OpenStack client cli.

The following environment variables MUST be set for authentication. These can
easily be set by sourcing the OpenStack RC file you downloaded from your
OpenStack tenant.

export OS_IDENTITY_API_VERSION=
export OS_AUTH_URL=
export OS_USER_DOMAIN_NAME=
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
	  IMAGE
	  INSTANCE_NAME
)

log  "Checking if OpenStack authentication environment variables are set.."

# quit if required environment variables not found
for var in ${REQUIRED_ENV_VARS[@]}; do
    if [[ ! -v $var ]]; then
        log ": Environment variable: ${var} not set."
        exit 1
    fi
done

# define variables
# readonly IMAGE=""
readonly FLAVOR=""
readonly KEYPAIR=""
readonly SECURITY_GROUP=""
readonly NETWORK=""

log "OpenStack authentication environment variables set!"

log "Launch instance.."

# create a new server
openstack server create \
--image $IMAGE \
--flavor $FLAVOR \
--key-name $KEYPAIR \
--security-group $SECURITY_GROUP \
--network $NETWORK \
$INSTANCE_NAME

log "Request to launch instance was successful!"
