The dhclient starts up on boot and gets a list of network interfaces from the dhclient.conf file. For each interface listed it tries to configure the interface using the DHCP protocol.

In the dhclient.leases file, dhclient keeps track of a list of leases across system reboots, after reading dhclient.conf, the dhclient.leases file is read to let it know what leases it's already assigned.

-> to obtain a fresh ip - 

	sudo dhclient