
Internet control message protocol is a part of TCP/IP protocol suite. it used to send updates and error messages and is an extremely useful protocol used for debugging network issues such as a failed packet delivery. Each ICMP message contains a type, code and checksum field. The type field is the type of ICMP message, the code is a sub-type and describes more information about the message and the checksum is used to detect any issues with the integrity of the message.

Some ICMP types: 
- Type 0: Echo reply
- Type 3: Destination unreachable
- Type 8: Echo request
- Type 11: Time exceeded

When a packet can't get to a destination, Type 3 ICMP message is generated, within Type 3 there are 16 code values that will further describe why it can't get to the destination:

- Code 0 - Network Unreachable
- Code 1 - Host Unreachable
etc..etc..

