#!/bin/sh
/usr/sbin/mysqld &
sleep 10
echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
echo "UPDATE mysql.user SET authentication_string = PASSWORD('root') WHERE User = 'root'; FLUSH PRIVILEGES" | mysql

