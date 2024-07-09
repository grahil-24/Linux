
type command hostname
	- which prints the hostname of your computer/server

	the hostname configuration are present in /etc/hostname
	

	command hostnamectl shows hostname and also some additional info
	 - sudo hostnamectl set-hostname my-laptop
	changes the hostname 


	you can set domain to hostname like my-laptop.mydomain.com
	 but only my-laptop will be visible as only string till first period will be taken into consideration, but when we use command hostname, the full hostname will be visible 