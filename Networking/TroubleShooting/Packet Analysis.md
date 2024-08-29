
Two extremely popular packet analyzers - tcpdump and wireshark. they scan the network interfaces, capture packet activity, parse the packages and output the information to us. 

<h4>TCPdump:</h4>
Eg: sudo tcpdump -i wlp3s0

dropped privs to tcpdump
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on wlp3s0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
13:23:59.378641 IP6 whatsapp-cdn6-shv-01-pnq1.fbcdn.net.https > fedora.50862: Flags [P.], seq 718629566:718629842, ack 1604956091, win 1287, options [nop,nop,TS val 669102460 ecr 2871077998], length 276
13:23:59.378643 IP6 whatsapp-cdn6-shv-01-pnq1.fbcdn.net.https > fedora.50862: Flags [P.], seq 0:276, ack 1, win 1287, options [nop,nop,TS val 669103111 ecr 2871077998], length 276
13:23:59.378742 IP6 fedora.50862 > whatsapp-cdn6-shv-01-pnq1.fbcdn.net.https: Flags [.], ack 276, win 1990, options [nop,nop,TS val 2871087009 ecr 669102460], length 0

this command captures packet data on the interface wlp3s0 which is the wlan interface. Lets understand the output - 

13:23:59.378641 IP6 whatsapp-cdn6-shv-01-pnq1.fbcdn.net.https > fedora.50862: Flags [P.], seq 718629566:718629842, ack 1604956091, win 1287, options [nop,nop,TS val 669102460 ecr 2871077998], length 276

- 13:23:59.378641 - The first field is the timestamp.
- IP6 - this contains the protocol information
- whatsapp-cdn6-shv-01-pnq1.fbcdn.net.https > fedora.50862 - this field contains the source and the destination. 
	- **whatsapp-cdn6-shv-01-pnq1.fbcdn.net**: The source hostname (which resolves to an IP address).
	- https: source port. port 443
	- fedora.50862 - fedora hostname. 50862 is the destination port number.
- **https**: The source port, in this case, it's port 443, commonly used for HTTPS traffic.
- seq 718629566:718629842 - the starting and ending sequence number 
- length 276 - length in bytes 
- **win 1287**: The window size: This value (1287) tells how much more data (in bytes) the sender of this packet is willing to receive.


-> Writing tcpdump output to a file 

	sudo tcpdump -w /pathtofile