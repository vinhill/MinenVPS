# MinenVPS

Utility scripts for managing a Minecraft forge server on Linux, e.g. from a virtual private server.

Features
- Uses [MSH](www.github.com/gekware/minecraft-server-hibernation) to reduce RAM usage of the server to a minimum when idle.
- Performs daily backups and keeps fewer and fewer as they get older

# start.sh

Using the screen command, starts the server. Access the console via `screen -r minecraft`.

# setup.sh

Downloads the necessary files.

# backup.sh

Creates an archive of ./world and removes some old backups.
- For the last 10 days, all backups are kept.
- For the last 30 days, all Sunday backups are kept.
- Otherwise, all backups for the first of the month are kept.

# msh-config.json

Config for MSH, specifies how to start the server, also how much RAM the JVM should allocate.