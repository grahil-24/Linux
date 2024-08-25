
<h4>What is a router: </h4>
A router enables machines on a network to communicate with each other as well as other networks. On a typical router, it will have LAN ports, that allow your machines to connect to the same local area network and it will also have an Internet uplink port that connects you to the Internet, sometimes you'll see this port being labelled as WAN, because it is essentially connecting you to a wider network. When we do any sort of networking activity, it has to go through the router. The router decides where our network packets go and which ones come in. It routes our packets between multiple networks to get from it's source host to it's destination host.

<h5>How does a router work? </h5>
When we route packets, they use similar address "routes", such as to get to network A, send these packets to network B. When we don't have a route set for that, we have a default route that our packets will use. These routes are set on a routing table that our system uses to navigate us across networks.

<h5>Hops</h5>
Each hop is an intermediate device like the routers, that the packet passes through, when travelling from source to destination. Eg: Let's say we have two routers connecting host A to host B, so therefore we say there are two hops between host A and host B.

<h5>Understanding the basic difference between Switching, Routing & Flooding?</h5>
Packet SWITCHING is basically receiving, processing and forwarding data to the destination device.  
ROUTING is a process of creating the routing table, so that we can do SWITCHING better.  
Before routing, FLOODING was used. If a router don't know which way to send a packet than every incoming packet is sent through every outgoing link except the one it arrived on.


<h5>Routing table </h5>

to see a machine's routing table - sudo route -n.


Destination     Gateway         Genmask         Flags Metric Ref    Use    Iface
0.0.0.0           192.168.72.211  0.0.0.0               UG    600    0        0     wlp3s0
172.17.0.0         0.0.0.0         255.255.0.0            U     0        0        0     docker0
192.168.72.0    0.0.0.0         255.255.255.0       U    600    0         0      wlp3s0

1. Destination - 
		Eg: 
	 Destination     Gateway      Genmask             Flags   Metric   Ref    Use    Iface
	192.168.72.0    0.0.0.0         255.255.255.0       U       600         0         0      wlp3s0

 The first field is the destination.  The gateway address for this route is `0.0.0.0`, which means there is no specific gateway required for this route. It implies that the destination is directly reachable within the local network segment without needing to forward packets through another router.

2. Gateway - 

	If we are sending a packet that is not on the same network, it will be sent to this Gateway address. Which is aptly named as being a Gateway to another network.

3. Genmask - This is the subnet mask, used to figure out what IP addresses match what destination. 

4. Flags - 

	- UG - Network is Up and is a Gateway
	- U - Network is Up
	-  H -  for "Host", indicating that the route is specific to a single host. 


5. Iface - Interface that the packet will be going out of. 


<h4>Path of a packet</h4>
<h5> i. Within a local network </h5>
1. First the local machine will compare the ip address to see if its in the same subnet by checking the subnet mask. 
2. We need the source IP and MAC, destination IP and MAC for the packet to be sent, but at this point we dont have the destination MAC address. 
3. So we send a ARP to broadcast a request on the local network to find the destination MAC address. 
4. Now the packet can be sent successfully. 


<h5>ii. Outside the local network </h5>
1. First the local machine will compare the destination IP address, since its outside of our network, it does not see the MAC address of the destination host. And we can't use ARP because the ARP request is a broadcast to locally connected hosts.
2. So our packet now looks at the routing table, it doesn't know the address of the destination IP, so it sends it out to the default gateway (another router). So now our packet contains our source IP, destination IP and source MAC, however we don't have a destination MAC. Remember MAC addresses are only reached through the same network. So what does it do? It sends an ARP request to get the MAC address of the default gateway.
3. The router looks at the packet and confirms the destination MAC address, but it's not the final destination IP address, so it keeps looking at the routing table to forward the packet to another IP address that can help the packet move along to its destination. Everytime the packet moves, it strips the old source and destination MAC address and updates the packet with the new source and destination MAC addresses.
4. Once the packet gets forwarded to the same network, we use ARP to find the final destination MAC address
5. During this process, our packet doesn't change the source or destination IP address.



<h1>Routing Protocols</h1>
Routing protocols are used to help our system adapt to network changes, it learns of different routes, builds them in the routing table and then routes our packets through that way. There are two primary routing protocol types, distance vector protocols and link state protocols.

<h3>1. Distance vector protocol</h3>
Distance vector protocols determine the path of other networks using the hop count a packet takes across the network. If network A was 3 hops away and network B was next to network A, then we assume it must be 4 hops away. In distance vector protocols, the next route would be the one with the least amount of hops.

Distance vector protocols are great for small networks, when networks start to scale it takes longer for the routers to converge because it periodically sends the entire routing table out to every router. Another downside to distance vector protocols is efficiency, it chooses routes that are closer in hops, but it may not always choose the most efficient route.

One of the common distance vector protocols is RIP (Routing Information Protocol), it broadcasts the routing table to every router in the network every 30 seconds. For a large network, this can take some serious juice to pull off, because of that RIP limits it's hop count to 15.

<h3>2. Link State protocol</h3>
Link state protocols are great for large scale networks, they are more complex than distance vector protocols, however a large upside is their ability to converge quickly, this is because instead of periodically sending out the whole routing table, they only send updates to neighboring routes. They use a different algorithm to calculate the shortest path first and construct their network topology in the form of a graph to show which routers are connected to other routers.

One of the common link state protocols is OSPF (Open Shortest Path First), it only updates the routing tables if there was a network change. It doesn't have a hop limit.


<h3>3. Border Gateway Protocol </h3>

