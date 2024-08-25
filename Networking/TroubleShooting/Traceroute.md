
Used to see how are packets are getting routed. It works by sending packets, which have ttl value greater than the previous by 1. So the first packet, reaches the first router and the ttl becomes 0.  So the router sends back an ICMP time exceeded message back to us. The second packet we send will have an TTL of 2. So on the 2nd hop, the ttl becomes 0 and the 2nd router, sends back the ICMP time exceeded message. We do this till, our packet reaches the destination which sends us an ICMP  echo reply msg, and through the ICMP messages, we can make a path, through which the packet had travelled.

Eg: traceroute www.google.com

traceroute to www.google.com (142.250.199.132), 30 hops max, 60 byte packets
 1  dsldevice.lan (192.168.1.1)  6.686 ms  6.513 ms  6.469 ms
 2  117.99.111.255 (117.99.111.255)  8.139 ms  8.110 ms  16.415 ms
 3  125.18.249.21 (125.18.249.21)  22.823 ms 125.19.45.213 (125.19.45.213)  8.010 ms  8.748 ms
 4  116.119.106.202 (116.119.106.202)  16.224 ms 116.119.52.131 (116.119.52.131)  16.328 ms 116.119.73.90 (116.119.73.90)  16.905 ms
 5  72.14.212.48 (72.14.212.48)  19.715 ms  19.782 ms  19.482 ms
 6  * * *
 7  142.250.60.134 (142.250.60.134)  21.616 ms 72.14.237.10 (72.14.237.10)  60.329 ms 142.250.214.108 (142.250.214.108)  62.542 ms
 8  142.251.77.99 (142.251.77.99)  62.479 ms  62.416 ms  62.375 ms
 9  bom07s36-in-f4.1e100.net (142.250.199.132)  61.579 ms  61.539 ms 142.250.208.227 (142.250.208.227)  61.944 ms

Each line is a router or machine that is between me and my target. It shows the name of the target and its IP address and the last three columns correspond to the round-trip time of a packet to get to that router. By default, we send three packets along the route.