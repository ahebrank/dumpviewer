# (MySQL) Dumpviewer

A quick tool for loading up a dumpfile in a temporary container.  You could use grep, but maybe you need to be able to query the dump as an actual database.

This script is set up to work on OSX via the Docker Quickstart Terminal (i.e., it assumes Docker is in a VM and uses `open` to bring up a browser). Modifications to make it work on other platforms should be minimal.

## What it does

When you run

```bash
./view dumpfile.sql
```

the bash script pulls in and/or runs some docker images ([mysql](https://hub.docker.com/_/mysql/) and [phpmyadmin](https://github.com/ahebrank/docker-phpmyadmin)) and loads the dump file into a database. A phpmyadmin portal for that database will then load in your browser.

## Cleaning up

`./cleanup` will remove the three docker containers (the data container, the mysql server, and the phpmyadmin/nginx web host).  Or you can just shut down your Docker VM.