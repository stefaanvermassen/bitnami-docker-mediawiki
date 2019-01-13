#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "httpd" ]]; then
  chmod 700 init.sh
  chmod 700 create_metadata.sh
  . /init.sh
  ./create_metadata.sh
  nami_initialize apache php mysql-client libphp mediawiki
  info "Starting mediawiki... "
fi

exec tini -- "$@"
