#!/bin/bash

# Wrap configuration before run

env

echo "Configuring"

perl -p -i.bak -e 'print STDERR "expanding $1 to ". $ENV{$1} ."\n" if /ENV_(\w+)/;' -e 's/ENV_(\w+)/$ENV{$1}/ge' /etc/nginx/conf.d/*.conf

echo "Starting '$*'"

exec "$@"