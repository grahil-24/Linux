
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
