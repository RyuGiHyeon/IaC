#!/bin/bash

dnf install httpd php8.4 php8.4-mysqlnd -y

wget https://ko.wordpress.org/wordpress-6.9.4-ko_KR.tar.gz
tar zxf wordpress-6.9.4-ko_KR.tar.gz
mv wordpress/* /var/www/html
rm -rf wordpress *.gz

aws s3 cp s3://wordpress-259732630270-ap-northeast-2-an/wp-config.php /var/www/html/wp-config.php

output "s3_address_map"
value: {"wp-config" : "s3://${bucket}/${key}"}

systemctl restart httpd.service
systemctl enable httpd.service