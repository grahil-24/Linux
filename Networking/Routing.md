
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