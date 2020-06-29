#!/bin/bash

chown -R mongodb:mongodb /var/lib/mongodb
exec gosu mongodb "$@"
