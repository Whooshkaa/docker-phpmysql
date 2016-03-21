# Version 0.0.1
FROM whooshkaa/docker-php
MAINTAINER Phil Dodd "tripper54@gmail.com"
ENV LAST_UPDATED 2016-03-22

# mysql and supervisord
RUN apt-get install -y mysql-client-5.6 mysql-server-5.6 python-mysqldb


EXPOSE 80
CMD ["/usr/bin/supervisord"]


