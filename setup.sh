#!/usr/bin/env sh

# get minecraft-server-hibernation
wget -O msh.bin https://github.com/gekware/minecraft-server-hibernation/releases/download/v2.5.0/msh-v2.5.0-0876091-linux-amd64.bin
chmod +x msh.bin

# setup local installation of java
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz
tar -xvf jdk-21_linux-x64_bin.tar.gz
rm -f jdk-21_linux-x64_bin.tar.gz

source "$(dirname "$0")/common.sh"

# setup forge minecraft server
wget -O "forge-installer.jar" https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar
java -jar forge-installer.jar --installServer
rm -f forge-installer.jar
echo "eula=true" > eula.txt
rm -f user_jvm_args.txt

# Update msh-config.json StartServer path
sed -E -i 's#(@libraries/net/minecraftforge/forge/)[^/]+(/unix_args.txt)#\1'"$FORGE_VERSION"'\2#g' msh-config.json
# Update msh-config.json Version
sed -E -i 's#("Version"[[:space:]]*:[[:space:]]*")[^"]+(")#\1'"$MC_VERSION"'\2#g' msh-config.json

# make backup dir for ./backup.sh script
mkdir -p "${BASE_DIR}/backups"

# optionally copy mods to ./mods
# Run the server manually once before starting msh so that it is setup
# log these as commands to the user
echo "Optionally copy mods to ${BASE_DIR}/mods"
echo "Please start the server manually for setup before using msh"