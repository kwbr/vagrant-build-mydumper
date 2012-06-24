#!/bin/bash

PATH='/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin'

start_date="$(date +%s)"
target="/opt/mydumper-${start_date}"

mkdir ${target}

cd /opt/mydumper-0.5.1

cmake -DCMAKE_INSTALL_PREFIX=${target} .
make
make install

cd /opt/debs

fpm -s dir -n mydumper -v 0.5.1 --iteration "${start_date}" \
    -C "${target}" -t deb --prefix /usr --url http://www.mydumper.org/ \
    --description "A high-performance MySQL backup tool." .
