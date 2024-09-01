
Low level networking only understands the raw IP address to identify a host. DNS allows us humans to keep track of websites and hosts by name instead of an IP address. DNS is fundamentally a distributed database of hostnames to ip addresses. 

<h4>DNS components: </h4>
1. Name Server - the name servers load up our DNS settings and configs and answers any questions from clients or other servers that want to know things like "Who is google.com?" If the name server doesnt have the answer to a query, it will redirect the query to other name servers. Name servers can be authoritative, meaning they hold the DNS records you are looking for , or recursive meaning they dont have it, but would ask other servers, which in turn would ask other servers and so on until they find an authoritative server which contains the needed DNS record. Recursive servers can also have the information we want cached instead of reaching an authoritative server.

2. Zone file - Zone files are how the name server stores information about the domain or how to get to the domain if it doesn't know.

3. Resource records - This is what comprises the zone file. Each line is a resource record and contains info about hosts, nameservers, other resources etc. 
		- Record name
		- TTL - time to live. TTL in DNS is in seconds and not number of hops in packets. After TTL amount of time the record is discarded. 
		- Class - Namespace of the record information, most commonly IN is used for Internet
		- Type - type of info stored in record data. Eg: A for address, MX for mail exchanger etc. 
		- Data - If the type is 'A', this field contains the IP address. Or something else depending on type. 


		Eg: rahil      IN   A    11.213.12.1


<h4>DNS process: </h4>

1. **Local DNS Server Request**

- When you type a website's address (like `catzontheinterwebz.com`) into your browser, your computer doesn't know where this site is located on the Internet. Instead, it asks a **local DNS server** (usually provided by your ISP) to find out.
- This local DNS server acts as a "middleman" to find the IP address associated with the domain name.

2. **Root Servers**

- If the local DNS server doesn't already know the IP address, it starts by asking the **Root Servers**.
- The Internet has 13 root servers, but they are mirrored worldwide, so there are actually many servers. These servers don't directly know the address for specific websites, but they do know which **Top-Level Domain (TLD) DNS servers** to ask based on the domain extension (.com, .org, etc.).
- For example, the root server will say, "I don't know where `catzontheinterwebz.com` is, but I know who handles `.com` domains. Go ask them."

3. **Top-Level Domain (TLD) DNS Server**

- The local DNS server then asks the **TLD DNS server** responsible for `.com` domains.
- The TLD server doesn't have the exact address of `catzontheinterwebz.com`, but it does know which **Authoritative DNS server** manages that domain.
- It provides the IP address of the authoritative DNS server for `catzontheinterwebz.com`.

4. **Authoritative DNS Server**

- Finally, the local DNS server asks the **Authoritative DNS server** for `catzontheinterwebz.com` for the exact IP address.
- The authoritative DNS server contains the specific records for the domain. It checks its records and returns the IP address where `catzontheinterwebz.com` is hosted.

5. **Returning the IP Address**

- Once the local DNS server has the IP address, it gives this information back to your computer.
- Your computer can now use this IP address to connect to the server hosting `catzontheinterwebz.com`, and you can see the website.


<h4>/etc/hosts</h4>
Before our machine hits the DNS with the query, it first looks locally on our machine

This file contains the mapping of hostnames to IP addresses. 

Eg: 
127.0.0.1             fedora
127.0.1.1              fedora_vm

by default localhost address is always present in this file.  You can also block access to hosts by adding them to the /etc/hosts.deny file or allow access to hosts by adding them to the /etc/hosts.allow file. But this is not a recommended way. Modify the firewall rules instead.


<h4>/etc/resolv.conf</h4>

Quite an irrelevant file nowadays. It isnt manually managed anymore. It is used to map DNS nameservers  for more efficient lookups. 
