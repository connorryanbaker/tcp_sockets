require 'socket'

# what really separates a client from a server is the call to connect
# this call initiates a connection to a remote socket

socket = Socket.new(:INET, :STREAM)

remote_addr = Socket.pack_sockaddr_in(80,'google.com')
socket.connect(remote_addr)

# This will initiate a TCP connection from a local port in the 
# ephemeral range to a listening socket on port 80 of google.com


# What happens if we try to connect to a non-existent / underprepared server? eg a server that has yet to start accepting connections

# your request will timeout! 
# connect will only return successfully if the server accepts the connection


