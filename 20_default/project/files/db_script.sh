#!/bin/bash

dnf install -y mariadb1011-client-utils
aws s3 cp s3://s3-259732630270-test-board/db_init.sql /tmp/db_init.sql
mariadb -h database-board.c1sqeewei6x5.ap-northeast-2.rds.amazonaws.com -u root -ppassword123 < /tmp/db_init.sql
sleep 6
shutdown -P now
