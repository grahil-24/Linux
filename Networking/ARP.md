mac address lookup protocol. First the locally stored ARP cache is checked. using arp command we can look at this cache

The arp cache is actually empty, when our machine boots up. It gets populated as packets are sent to other hosts. If we send a packet to a destination that isn't in the ARP cache, the following happens:

1. The source host creates the Ethernet frame with an ARP request packet
2. The source host broadcasts this frame to the entire network
3. If one of the hosts on the network knows the correct MAC address, it will send a reply packet and frame containing the MAC address
4. The source host adds the IP to MAC address mapping to the ARP cache and then proceeds with sending the packet

ARP cache can also be looked up through the command - ip neighbour show