Used to test whether a packet can reach the host or not. Works by sending ICMP echo request (Type 8) to the destination host and waits for an echo reply(type 0). 

Eg: ping -c 3 www.google.com
64 bytes from bom12s08-in-x04.1e100.net (2404:6800:4009:813::2004): icmp_seq=1 ttl=59 time=23.2 ms
64 bytes from bom12s08-in-x04.1e100.net (2404:6800:4009:813::2004): icmp_seq=2 ttl=59 time=76.4 ms
64 bytes from bom12s08-in-x04.1e100.net (2404:6800:4009:813::2004): icmp_seq=3 ttl=59 time=88.3 ms

	- c flag is the total amount of packets to be sent

	

-> icmp_seq -  shows the sequence number of packets sent. If we do a ping, and get some sequence numbers missing, means theres some issue with our network and some packets are getting lost. If the sequence numbers are out of order, that means that our network is slow. 

-> ttl - Time to live. Denotes the maximum number of hops our packet can take. Every time it hops, the ttl decreases by 1. If it becomes 0 means our packet is dead. We dont want our packet to be travelling around forever.

-> time - roundtrip time. Time it took for the sender to send the request and getting an echo reply. 