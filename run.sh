#!/bin/bash

. "$(dirname "$0")/common.sh"

java \
    @libraries/net/minecraftforge/forge/${FORGE_VERSION}/unix_args.txt \
    "$@"
