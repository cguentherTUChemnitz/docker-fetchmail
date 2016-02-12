#!/bin/sh

run()
{ 
    chmod 0600 /data/etc/fetchmailrc
    chown fetchmail:fetchmail /data/etc/
    chown fetchmail:fetchmail /data/etc/fetchmailrc
    touch /data/log/fetchmail.log
    chown fetchmail:fetchmail /data/log/fetchmail.log
    # run cron daemon, which executes the logrotate job
    crond
    # run fetchmail as endless loop with reduced permissions
    su -s /bin/sh -c '/bin/sh /bin/fetchmail_daemon.sh' fetchmail
}

run

