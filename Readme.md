# MinenVPS

Utility scripts for managing a Minecraft forge server on Linux, e.g. from a virtual private server.

Features
- Uses [MSH](www.github.com/gekware/minecraft-server-hibernation) to reduce RAM usage of the server to a minimum when idle.
- Performs daily backups and keeps fewer and fewer as they get older

## common.sh

Common variables such as minecraft and forge version, java path etc.

## start.sh

Creates a lockfile and runs monitor.sh

## monitor.sh

Does nothing if no lockfile exists.
Checks if msh is running and starts it if it is not.
Access the console via `screen -r msh-minecraft`.

## backup.sh

Does nothing if no lockfile exists.
Creates an archive of ./world and removes some old backups.
- For the last 10 days, all backups are kept.
- For the last 30 days, all Sunday backups are kept.
- Otherwise, all backups for the first of the month are kept.

## setup.sh

Downloads the necessary files.

## run.sh

Runs the server without MSH or lockfile.

## msh-config.json

Config for MSH, specifies how to start the server, also how much RAM the JVM should allocate.

## cronjobs

- run on boot
- backup daily 4:30 AM
- monitor server daily 5:30 AM
```
@reboot su - minecraft -c '/home/minecraft/start.sh' > /dev/null 2>&1
30 4 * * * /home/minecraft/backup.sh > /dev/null 2>&1
30 5 * * * /home/minecraft/monitor.sh > /dev/null 2>&1
```
