
Breaks our data into chunks that will be transported and put back together in the correct order. These chunks are known as segments.  This makes it easier to transport data across networks. 

<h4>Ports:</h4>
Protocols use certain ports to communicate. Knowing IP addresses isnt enough to send data over networks. We also need ports where certain services are "listening" for data. For eg: If we want to send webpage data we need to send it over the HTTP port which is 80. Transport layer also sends the source port and destination port info in the header of the segments, so when the receiver gets the packet it knows which port to use. 

<h4>UDP:</h4>
Not reliable as it doesnt care if you get your original data. But this is ok in some cases where speed matters a lot, for eg: media streaming. 

<h4>TCP:</h4>
TCP provides a reliable connection-oriented stream of data. TCP uses ports to send data to and from hosts. An application opens up a connection from one port on its host to another port on a remote host. In order to establish the connection, we use the TCP handshake.

- The client (connecting process) sends a SYN segment to the server to request a connection
- Server sends the client a SYN-ACK segment to acknowledge the client's connection request
- Client sends an ACK to the server to acknowledge the server's connection request

Once this connection is established, data can be exchanged over a TCP connection. The data is sent over in different segments and are tracked with TCP sequence numbers so they can be arranged in the correct order when they are delivered. In our email example, the transport layer attaches the destination port (25) to the source port of the source host.


![[Pasted image 20240913152517.png]]


- source port - 16 bit field that specifies the port number of the sender
- destination port - 16 bit field that specifies the port number of the reciever
- sequence number - the sequence number is a 32 bit field that indicates how much data is sent during the TCP session. When you establish a new TCP connection (3 way handshake) then the initial sequence number is a random 32 bit value. The receiver will use this sequence number and sends back an acknowledgment. Protocol analyzers like wireshark will often use a _relative sequence number of 0_ since it’s easier to read than some high random number.
- acknowledgement number - this 32 bit field is used by the receiver to request the next TCP segment. This value will be the sequence number incremented by 1.
- Data offset] - 4 bit field which specifies the length of the tcp header so we know where the actual data begins. 
- Reserved - 3 bits. In most cases kept 0
- Flags - 9 bits. Also known as control bits. We use them to establish connections, send data and terminate connections. The different control bits are - 
		- **URG**: urgent pointer. When this bit is set, the data should be treated as priority over other data.
		- **ACK**: used for the acknowledgment.
		- **PSH**: this is the push function. This tells an application that the data should be transmitted immediately and that we don’t want to wait to fill the entire TCP segment.
		- **RST**: this resets the connection, when you receive this you have to terminate the connection right away. This is only used when there are unrecoverable errors and it’s not a normal way to finish the TCP connection.
		- **SYN**: we use this for the initial three way handshake and it’s used to set the initial sequence number.
		- **FIN**: this finish bit is used to end the TCP connection. TCP is full duplex so both parties will have to use the FIN bit to end the connection. This is the normal method how we end an connection.

- **Window**: the 16 bit window field specifies how many bytes the receiver is willing to receive. It is used so the receiver can tell the sender that it would like to receive more data than what it is currently receiving. It does so by specifying the number of bytes beyond the sequence number in the acknowledgment field.
- **Checksum**: 16 bits are used for a checksum to check if the TCP header is OK or not.
- **Urgent pointer**: these 16 bits are used when the URG bit has been set, the urgent pointer is used to indicate where the urgent data ends.
- **Options**: this field is optional and can be anywhere between 0 and 320 bits.