
<h5>=> Some  important ports</h5>
	We can get list of well known ports by looking into the /etc/services file

	 ftp             21/tcp
  
	ssh             22/tcp
	  
	smtp            25/tcp 
	  
	domain          53/tcp  # DNS
	  
	http            80/tcp
	  
	https           443/tcp

The first column is the name of the service, then the port number and the transport layer protocol it uses.

Netstat is used to get detailed information about our network like network connections, routing tables, info about network interfaces etc. 

-> Difference between socket and port - 
A socket is an interface which allows programs to send and receive data. While a port is used to identify which application should send or receive data. The socket is combination of ip address and port. Every connection between a host and destination requires a unique socket. For example, HTTP is a service that runs on port 80, however we can have many HTTP connections and to maintain each connection a socket gets created per connection.


Eg: netstat -at

tcp6       0      0 [::]:xmsg               [::]:*                  LISTEN     
tcp6       0      0 fedora:59998            bom12s12-in-x0a.1:https ESTABLISHED
tcp6       0      0 fedora:49718            pnbomb-aa-in-x0e.:https ESTABLISHED
tcp6       0      0 fedora:48908            whatsapp-cdn6-shv:https ESTABLISHED
tcp6       0      0 fedora:46744            2606:50c0:8000::1:https ESTABLISHED
tcp6      76      0 fedora:34912            2a04:4e42:24::347:https CLOSE_WAIT 
tcp6       0      0 fedora:53206            bom07s01-in-x0a.1:https ESTABLISHED

The netstat -a command shows the listening and non-listening sockets for network connections, the -t flag shows only tcp connections.

The columns are as follows from left to right:

- Proto: Protocol used, TCP or UDP.
- Recv-Q: Data that is queued to be received
- Send-Q: Data that is queued to be sent
- Local Address: Locally connected host
- Foreign Address: Remotely connected host
- State: The state of the socket

Socket states - 
	1. LISTEN - socket is listening for incoming connections. To make any sort of connection, the destination has to be listening
	2. SYN_SENT - socket is trying to establish a connection
	3. ESTABLISHED - the socket has established connection
	4. CLOSE_WAIT - remote host has shut down and we're waiting for the socket to close
	5. TIME_WAIT - The socket is waiting after close to handle packets still in the network