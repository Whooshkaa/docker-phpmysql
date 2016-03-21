# Version 0.0.1
FROM whooshkaa/docker-php
MAINTAINER Phil Dodd "tripper54@gmail.com"
ENV LAST_UPDATED 2016-03-22

# mysql
RUN apt-get install -y mysql-client-5.6 mysql-server-5.6 python-mysqldb

# copy supervisor file with added mysql start command
RUN rm /etc/supervisor/conf.d/supervisord.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# setup mysql
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
ADD set-mysql-password.sh /tmp/set-mysql-password.sh
RUN /bin/sh /tmp/set-mysql-password.sh

EXPOSE 80
CMD ["/usr/bin/supervisord"]


