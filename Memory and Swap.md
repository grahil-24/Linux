
HTOP is not always available on all servers. So an alternative is the free command 

	free -h prints the data in human readable format
	


	   total        used        free      shared  buff/cache   available
Mem:     949Mi          146Mi             597Mi          2.0Mi       205Mi            662Mi
Swap:         0B              0B                 0B

		- We mostly want to focus on available memory and not free memory. 
		- Available tells us how much memory is actually free. 
		- Linux likes to cache as much as possible, so free memory is so less. Fetching from RAM is much 
		  faster than fetching the data from the disk. 
		- Available means not totally free. Some data is present in that part. But suppose an application 		  requires more memory, then OS frees up some memory from the available part.  
		

	What is swap?
		- We want to use as little swap as possible, as it is slow(extremly!!!). It can be thought of as
		emergency memory. 
		- It is used when system is out of memory. 
		- Swap exists on the disk and not RAM.
		
	-> Swappiness variable
		- To determine how much swap should be present on a server
		- to get the swappiness value, run the command 
			sysctl vm.swappiness
		- lower the swappiness, less probability of swap being used. 