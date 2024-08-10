Dynamic Host Configuration Protocol.  DHCP assigns IP addresses, subnet masks and gateways to our machines. You are also leased an IP address, these last for a certain period of time, then will get renewed depending on how you have your lease settings.

DHCP is great for many reasons, it allows a network administrator to not worry about assigning IP addresses and it also prevents them from setting up duplicate IP addresses. Every physical network should have its own DHCP server so that a host can request an IP address. In a regular home setting, the router usually acts as the DHCP server.

How does DHCP work? 

1. DHCP  DISCOVER - Message broadcasted to search for a DHCP server
2. DHCP OFFER - DHCP server replies with an offer, which contains the lease time, IP Address, subnet mask etc. 
3. DHCP REQUEST - The client sends out another broadcast to let all DHCP servers know which offer it accepted.
4. DHCP ACK - Acknowledgement is sent by the server.

