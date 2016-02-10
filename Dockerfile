FROM centos:7
MAINTAINER cguenther.tu.chemnitz@gmail.com

#install necessary packages
RUN yum -y update; \
    yum -y install fetchmail openssl logrotate cronie; \
    yum clean all;

#set workdir
WORKDIR /data

#setup fetchmail stuff
RUN groupadd -r fetchmail; \
    useradd -r -m -g fetchmail -s /bin/nologin -c "Fetchmail" fetchmail; \
    chown fetchmail:fetchmail /data; \
    chmod 0744 /data; 

#add logrotate fetchmail config
ADD etc/logrotate.d/fetchmail /etc/logrotate.d/fetchmail
#add startup script
ADD start.sh /bin/start.sh
#add fetchmail_daemon script
ADD fetchmail_daemon.sh /bin/fetchmail_daemon.sh

#set startup script rights
RUN chmod 0700 /bin/start.sh; \
    chown fetchmail:fetchmail /bin/start.sh; \
    chown fetchmail:fetchmail /bin/fetchmail_daemon.sh

VOLUME ["/data"]
CMD ["/bin/start.sh"]

