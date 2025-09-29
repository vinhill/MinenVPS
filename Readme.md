# MinenVPS

Utility scripts for managing a Minecraft forge server on Linux, e.g. from a virtual private server.

Features
- Uses [MSH](www.github.com/gekware/minecraft-server-hibernation) to reduce RAM usage of the server to a minimum when idle.
- Performs daily backups and keeps fewer and fewer as they get older

## monitor.sh

Checks if msh is running and starts it if it is not. Access the console via `screen -r msh-minecraft`.

## backup.sh

Creates an archive of ./world and removes some old backups.
- For the last 10 days, all backups are kept.
- For the last 30 days, all Sunday backups are kept.
- Otherwise, all backups for the first of the month are kept.

## setup.sh

Downloads the necessary files.

## msh-config.json

Config for MSH, specifies how to start the server, also how much RAM the JVM should allocate.

## cronjobs

- run on boot
```
@reboot su - minecraft -c '/home/minecraft/start.sh' > /dev/null 2>&1
```
- backup daily 4:30 AM
```
30 4 * * * /home/minecraft/backup.sh > /dev/null 2>&1
```
- monitor server daily 5:30 AM
```
30 5 * * * /home/minecraft/monitor.sh > /dev/null 2>&1
```

## start.sh

Using the screen command, starts the server. TODO this currently serves no purpose next to `monitor.sh`.

It would be preferable for `monitor.sh` and `backup.sh` to only do something if some lockfile exists. This file could then be removed to keep the server shutdown.
