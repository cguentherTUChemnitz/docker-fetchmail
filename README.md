# docker-fetchmail
alpine linux with fetchmail and logrotate

# configuration
create a local `etc/fetchmailrc` file and adjust it to your own needs
 - let the postmaster run as fetchmail
 - use the /data/log/fetchmail.log logging path for correct logrotate interop
example:
```
set no syslog
set logfile /data/log/fetchmail.log

set postmaster "fetchmail"

poll imap.gmail.com with proto IMAP
  user 'someusername@gmail.com' there with password 'yourpassword' is fetchmail here options ssl
  smtphost mail.example.org
  smtpname some.user@example.org
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
The fetchmail container logs directly into the mountpoint `log/fetchmail.log`
