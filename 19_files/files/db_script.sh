#!/bin/bash

dnf install -y mariadb1011-client-utils
aws s3 cp s3://s3-xxxxxx-board/db_init.sql /tmp/db_init.sql
mariadb -h endpoint-xxxxxxxx -u root -pPassw0rd123 < /tmp/db_init.sql
sleep 6
shutdown -P now
