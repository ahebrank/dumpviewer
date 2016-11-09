#!/bin/bash

ROOT_PWD=root
WEB_PORT=9980
MYSQL_PORT=9906

function run_db_container {
  if ! $( docker ps | grep -q "dump_db$" ); then
    # run the sql server
    docker run -d -it --name dump_db \
      -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql \
      -e MYSQL_DATABASE=dump -e MYSQL_ROOT_PASSWORD=$ROOT_PWD \
      -p $MYSQL_PORT:3306 \
      mysql
  fi
}

function wait_for_port {
  while ! curl http://localhost:$1/ &> /dev/null; do
    echo -n "."
    sleep 1
  done
  echo
}