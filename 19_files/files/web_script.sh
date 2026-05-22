#!/bin/bash
    
dnf install -y httpd php8.4 php8.4-mysqlnd
aws s3 cp s3://s3-259732630270-board-259732630270-ap-northeast-2-an/test_board.tar.gz /tmp/test_board.tar.gz
tar zxf /tmp/test_board.tar.gz -C /var/www/html
aws s3 cp s3://s3-xxxxxx-board/config.php /tmp/config.php

systemctl restart httpd.service
systemctl enable  httpd.service

