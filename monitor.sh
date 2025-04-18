#!/usr/bin/env sh
export JAVA_HOME=/home/minecraft/jdk-21.0.1
export PATH=$JAVA_HOME/bin:$PATH

if ! screen -ls | grep -q "msh-minecraft"; then
  #./msh.bin
  screen -dm -S msh-minecraft ./msh.bin
fi
