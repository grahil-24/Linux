Packets need to know where they are going right? This is where MAC(Media Access control) addresses and IP addresses help. As humans cant remember such long numbers for each machine/server, we use hostnames for each host. 

1. MAC Addresses: 

	Unique identifier used as hardware address. This never changes. When you want to get access to the Internet, your machine needs to have a device called a network interface card. This network adapter has its own hardware address that's used to identify your machine. A MAC address for an Ethernet device looks something like this 00:C4:B5:45:B2:43. MAC addresses are given to network adapters when they are manufactured. Each manufacturer has an organizationally unique identifier (OUI) to identify them as the manufacturer. This OUI is denoted by the first 3 bytes of the MAC address. For example, Dell has 00-14-22, so a network adapter from Dell could have a MAC address like: 00-14-22-34-B2-C2. It is 6 bytes or 48 bits long. 

2. IP Addresses: 

	Hardware independent address. It is used to identify a device on a network.  IP addresses are used with the software side of networking. Anytime a system is connected to the Internet it should have an IP address. They can also change if your network changes and are unique to the entire Internet. Remember it takes both software and hardware to move packets across networks, so we have two identifiers for each, MAC (hardware) and IP (software).

3. Hostnames: 

	One last way to identify your machines is through hostname. Hostnames take your IP address and allow you to tie that address to a human readable name. Instead of remembering 192.12.41.4 you can just remember myhost.com.

	