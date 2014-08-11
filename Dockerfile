###### Supervisord image
FROM centos:centos6
MAINTAINER "Christian Kniep <christian@qnib.org>"

## supervisord
RUN yum install -y python-meld3 python-setuptools
### Old version w/o syslog
RUN easy_install pip
RUN pip install supervisor
ADD etc/supervisord.conf /etc/supervisord.conf
### \WORKAROUND
RUN mkdir -p /var/log/supervisor
RUN sed -i -e 's/nodaemon=false/nodaemon=true/' /etc/supervisord.conf
ADD usr/local/bin/supervisor_daemonize.sh /usr/local/bin/supervisor_daemonize.sh

