
uptime command shows the uptime of a server, load average, number of users etc. 

another way to know the load average - cat /proc/loadavg

htop also shows the load average.

Lets understand the output of load average - 

	load average: 1.26, 1.27, 0.95 

		first number - 1.26 depicts the load for past 1 minute. 
		 second number -1.27 depicts load for over last 5 minutes
		 last - 0.95 show load for over last 15 minutes.


cat /proc/cpuinfo shows information about the cpu in our system/server. 


What constitutes a high load average? 

	- 1.26 does not mean 126% load. My cpu has 12 threads. so when the load
		average reaches 12.0, that means that the load is 100%. 



Out of these 3 numbers, which should we most pay attention to?
		- The number depicting last one minute is not much helpful. 
		-  5 minutes and 15 minutes are important



			