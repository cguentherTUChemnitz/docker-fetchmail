# docker-fetchmail
centos7 based fetchmail container

# configuration
create a local `etc/fetchmailrc` file and adjust it to your own needs, but let the postmaster run as fetchmail
example:
```
set no syslog
set logfile /data/log/fetchmail.log

# set username
set postmaster "fetchmail"

poll imap.gmail.com with proto IMAP
  user 'someusername@gmail.com' there with password 'yourpassword' is fetchmail here options ssl
  smtphost mail.example.org
  smtpname some.user@owndata.net
```

# docker-compose example
mount the folder, which contains the `etc/fetchmailrc` into the `/data` of the container
```yml
fetchmail:
  restart: always
  image: cguenther/docker-fetchmail
  hostname: fetchmail
  volumes:
    - ./fetchmail:/data:rw
```
The fetchmail container logs the directly your mountpoint `log/fetchmail.log`
