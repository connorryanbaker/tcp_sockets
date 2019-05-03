require 'socket'

socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)
# creates a stream socket in 'inet' (internet, ipv4)
# stream is provided by TCP
# what is ipv4? 
# our ip address is 4 numbers <= 255 joined by periods,o# with an ip address, one host can route data to another at that specific address

# how does one obtain the appropriate ip address?
# dns maps host names to ip addresses and will appropriately resoolve our requests

# Loopbacks - ip addresses don't necessarily have to refer to a remote address, like localhost
# Data sent to the loopback interface is received immediately on the same interface

# what is ipv6? we ran out of ipv4 addresses. there are 4 numbers in an ipv4 address - each has up to 3 digits meaning they can be represented in 8 bits, giving us 32 bits for our ip addresses

# this means there are 2 ^ 32 possibile numbers, or 4.3 billion

# Ports - port number is like the extension on a phone call.
# The combination of an ip address and port must be unique for each socket. 2 sockets with the same ipv4 address can not listen on the same port


# Connections - TCP connections are made between 2 endpoints, on the same machine or two different machines.
# When a socket is created, it must assume 1 of 2 roles - initiator or listener. 
# Both roles are required! Without a listener, no connection can be initiazed.
# The listener socket is conventionally called the SERVER
# The initiator socket is conventionally called the CLIENT
