
1. boot.log - log files for boot process
2. dnf.log - log files for packages, removed, installed or updated. 
3. wtmp - binary log. It gives details about logged in or logged out users. To view  a binary log use the command - 

		last


4. btmp - again a binary log file. It is a log file for bad login attempts. use the command "lastb" 

		sudo lastb -adF. -d - match dns name to ip addresses. -F gives us the full times. -a - Display the hostname in the last column. 


5. journalctl - used by oses using systemd. It is used to inspect log files of units or services in a system or server. 


		eg: journalctl -u httpd

			- view log files for unit/service httpd


		To follow a unit - 
				journalctl -fu ssh

		