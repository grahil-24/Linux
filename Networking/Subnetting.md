

<h4>IPV4- </h4>
Eg: 192.168.1.1 - It is 32 bits long and divided into two - network bits and host bits. Network portion that tells us know network it's on and the host portion that tells us which host on that network it is. You can view your IP address with the ifconfig -a command. 


<h4>Subnets: </h4>
A subnet is a group of hosts with IP addresses that are similar in a certain way. These hosts usually are in a proximate location from each other and you can easily send data to and from hosts on the same subnet. Think about it as sending mail in the same zip code, it's a lot easier than sending mail to a different state. A subnet is divided into a network prefix, such as 123.45.67.0 and a subnet mask.

<h5>-> Subnet Masks: </h5>
Determines what part of the IP address is the network portion and what part is the host. 
To determine the subnet mask - all the network bits are 1 and all the host bits are 0. Eg: 
255.255.255.0. This in binary is 11111111.11111111.11111111.00000000
Therefore there are 24 network bits and 8 host bits. From this we can derive that, in this subnet there can be a total of 2^8 hosts. But actually there are 2 IP addresses reserved for subnet address and broadcast address. So total hosts are 2^8 - 2. 

-- Why do we need subnets?
	Subnetting is used to segment networks and control the flow of traffic within that network. So a host on one subnet can’t interact with another host on a different subnet.


<h4>CIDR: </h4>
Classless Inter-Domain Routing. It is used to represent subnet mask in a more compact way. Eg: 10.42.3.0/24

Here 24 denotes the number of network bits ie the first 24 bits denote the network portion.


<h4>NAT: </h4>
Stands for Network Address Translation. 

NAT makes a device like our router act as an intermediary between the Internet and private network. So only a single, unique IP address is required to represent an entire group of computers.

Think of NAT is like a receptionist in a large office, if someone wants to contact you, they only know the number to the whole office, the receptionist would then have to look for your extension number and forward the call to you.

**How does it work?**  
  
A simple case would look like this:

1. Rahul wants to connect to www.google.com, so his machine sends this request through the router
2. The router takes that request and opens its own connection to google.com, then it sends Rahul's request once it makes a connection
3. The router is the intermediary between Rahul and www.google.com. Google doesn't know about Rahul instead all it can see is the router.