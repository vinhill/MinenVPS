#!/usr/bin/env sh
# Forge requires a configured set of both JVM and program arguments.
# Add custom JVM arguments to the user_jvm_args.txt
# Add custom program arguments {such as nogui} to this file in the next line before the "$@" or
#  pass them to this script directly
export JAVA_HOME=/home/minecraft/jdk-21.0.1
export PATH=$JAVA_HOME/bin:$PATH
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.21.8-58.1.0/unix_args.txt "$@"
