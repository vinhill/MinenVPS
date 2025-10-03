#!/usr/bin/env sh

# create lockfile so that cronjobs will restart server as needed
touch "$(dirname "$0")/running.lock"

source $(dirname "$0")/monitor.sh
