
At the bottom of the TCP/IP model sits the Link Layer. This layer is the hardware specific layer.
In the link layer, our packet is encapsulated once more into something called a frame. The frame header attaches the source and destination MAC addresses of our hosts, checksums and packet separators so that the receiver can tell when a packet ends. 
First, the link layer attaches my source MAC address to the frame header, but it needs to know Tom's MAC address as well. How does it know that and how do we find it since it's not on the Internet? We use ARP!

<h4>ARP:</h4>
stands for address resolution protocol. ARP finds the MAC address associated with an IP address. ARP is used within the same network. If Tom was not on the same network, we would use a routing system to determine the next router that would receive the packet and once we were on the same network, we could use ARP.

Once we are on the same network, systems first use the ARP look-up table that stores information about what IP addresses are associated with what MAC address. If the value is not there, then ARP is used. Then the system will send a broadcast message to the network using the ARP protocol to find out which host has IP 10.10.1.4. A broadcast message is a special message that is sent to all hosts on a network (aptly named for sending a broadcast). Any machine with the requested IP address will reply with an ARP packet containing the IP address and the MAC address.