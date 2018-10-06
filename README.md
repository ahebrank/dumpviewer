# (MySQL) Dumpviewer

A quick tool for loading up a dumpfile in a temporary docker network.  You could use grep, but maybe you need to be able to query the dump as an actual database.

This script is tilted towards  OSX (i.e., it uses `open` to bring up a browser). Modifications to make it work on other platforms should be minimal.

## What it does

### view

When you run

```bash
./view dumpfile.sql
```

the bash script pulls in and/or runs some docker images ([mysql](https://hub.docker.com/_/mysql/) and [phpmyadmin](https://github.com/ahebrank/docker-phpmyadmin)) and loads the dump file into a database. A phpmyadmin portal for that database will then load in your browser.

The database server is available on port 9906; the phpmyadmin web portal is available on 9980.

### diffprep

```bash
./diffprep dumpfile.sql
```

will reexport a dumpfile to an expanded state that might make it easy to diff with a related dump file.

### cleanup

`./cleanup` will take down and remove the docker network (`docker-compose down -v`)