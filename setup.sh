# get minecraft-server-hibernation
wget https://github.com/gekware/minecraft-server-hibernation/releases/download/v2.5.0/msh-v2.5.0-0876091-linux-amd64.bin
mv msh-v2.5.0-0876091-linux-amd64.bin msh.bin
chmod +x msh.bin

# setup local installation of java
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz
tar -xvf jdk-21_linux-x64_bin.tar.gz
rm jdk-21_linux-x64_bin.tar.gz
# xxx that is quite fragile, version number and path changes over time, e.g. now subfolder bin must be used
export JAVA_HOME=~/jdk-21.0.1
export PATH=$JAVA_HOME/bin:$PATH

# setup forge minecraft server
# xxx can we store the version somewhere more centralized?
wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.21.8-58.1.0/forge-1.21.8-58.1.0-installer.jar
java -jar forge-1.21.8-58.1.0-installer.jar --installServer
rm forge-1.21.8-58.1.0-installer.jar
echo "eula=true" > eula.txt
rm user_jvm_args.txt
# optionally copy mods to ./mods

# make backup dir for ./backup.sh script
mkdir backups