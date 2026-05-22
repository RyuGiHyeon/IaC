#!/bin/bash
    
dnf install -y httpd php8.4 php8.4-mysqlnd php8.4-pecl-redis6

aws s3 cp s3://s3-259732630270-board/test_board.tar.gz /tmp/test_board.tar.gz
tar zxf /tmp/test_board.tar.gz -C /var/www/html
    
aws s3 cp s3://s3-259732630270-test-board/config.php /var/www/html/config.php
sleep 5
aws s3 cp s3://s3-259732630270-test-board/www.conf /etc/php-fpm.d/www.conf

systemctl restart httpd.service
systemctl enable  httpd.service

