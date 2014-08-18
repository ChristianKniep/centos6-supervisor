###### Supervisord image
FROM centos:centos6
MAINTAINER "Christian Kniep <christian@qnib.org>"

### PIP
ADD etc/yum.repos.d/qnib.repo /etc/yum.repos.d/qnib.repo
RUN yum install -y python-setuptools python-supervisor
ADD etc/supervisord.conf /etc/supervisord.conf
### \WORKAROUND
RUN mkdir -p /var/log/supervisor
RUN sed -i -e 's/nodaemon=false/nodaemon=true/' /etc/supervisord.conf
ADD usr/local/bin/supervisor_daemonize.sh /usr/local/bin/supervisor_daemonize.sh

