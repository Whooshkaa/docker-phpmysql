#!/bin/sh

# Required to fix issue with mysqld failing to start
# See https://github.com/docker/for-linux/issues/72
find /var/lib/mysql -type f -exec touch {} \;

/usr/sbin/mysqld &
sleep 30
echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
echo "UPDATE mysql.user SET authentication_string = PASSWORD('root') WHERE User = 'root'; FLUSH PRIVILEGES" | mysql

