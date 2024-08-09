
Logs are human readable journal of events stored in our system. This data is usually kept in the /var directory.

1. boot.log - log files for boot process
2. dnf.log - log files for packages, removed, installed or updated. 
3. wtmp - binary log. It gives details about logged in or logged out users. To view  a binary log use the command - 

		last


4. btmp - again a binary log file. It is a log file for bad login attempts. use the command "lastb" 

		sudo lastb -adF. -d - match dns name to ip addresses. -F gives us the full times. -a - Display the hostname in the last column. 


5. journalctl - used by oses using systemd. It is used to inspect log files of units or services in a system or server. 


		eg: journalctl -u httpd

			- cview log files for unit/service httpd


		To follow a unit - 
				journalctl -fu ssh


<h4>System Logging:</h4>

 A service called syslog sends this info to our system logger. Syslog actually contains many components, one of the important ones is a daemon running called syslogd (newer Linux distributions use rsyslogd), that waits for event messages to occur and filter the ones it wants to know about, and depending on what it's supposed to do with that message, it will send it to a file, your console or do nothing with it 

The output of all the logs the syslog service collects can be found at /var/log/syslog. To find out what files are maintained by our system logger, look at the configuration files in /etc/rsyslog.d. 

In fedora and red hat based distros however, rsyslog is not installed by default. Journald does the work of it. Journald config file is present in - /etc/systemd/journald.conf and the logs are saved at /var/log/journal


<h4>Kernel logging: </h4>
**/var/log/dmesg**  
On boot-time your system logs information about the kernel ring buffer. This shows us information about hardware drivers, kernel information and status during bootup and more. This log file can be found at /var/log/dmesg and gets reset on every boot, you may not actually see any use in it now, but if you were to ever have issues with something during bootup or a hardware issue, dmesg is the best place to look. You can also view this log using the dmesg command.

**var/log/kern.log**  
Another log you can use to view kernel information is the /var/log/kern.log file, this logs the kernel information and events on your system, it also logs dmesg output.k


<h4>Authentication logging:</h4>
Authentication logging can be very useful to look at if you are having issues logging in. 

**var/log/auth.log**

This contains system authorization logs, such as user login and the authentication method used.

In red hat distros, the auth logs are in  - /var/log/audit 


<h4>Logrotate:</h4>
The logrotate utility does log management for us. It has a configuration file that allows us to specify how many and what logs to keep, how to compress our logs to save space and more. The logrotate tool is usually run out of cron once a day and the configuration files can be found in /etc/logrotate.d.

There are other logrotating tools you can use to manage your logs, but logrotate is the most common one.
