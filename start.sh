#!/bin/bash

# create lockfile so that cronjobs will restart server as needed
touch "$(dirname "$0")/running.lock"

. $(dirname "$0")/monitor.sh
