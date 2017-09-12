FROM centos:latest

MAINTAINER Steven Zinck (steven.zinck@novascotia.ca)

ADD ./webserver /usr/local/bin/webserver
ADD ./devops.html /usr/local/bin/devops.html

EXPOSE 8081

CMD /usr/local/bin/webserver
