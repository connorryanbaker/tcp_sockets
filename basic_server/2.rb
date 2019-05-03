require 'socket'
# Server Lifecycle

# 1. create
# 2. bind
# 3. listen
# 4. accept
# 5. close


# bind?
# We bind a socket to a port where it will listen for connections

# create new socket, ruby allows these symbols instead of
# Socket::AF_INET and Socket::SOCK_STREAM

# socket = Socket.new(:INET, :STREAM)
# create a c struct to hold the address for listening

# addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
# bind to the address, port 4481 on localhost

# socket.bind(addr)

# which port? there are 65535 different ports! 
# don't use one between 0-1024, they are reserved for system use
# don't use 49000-65535, these are ephemeral ports that are used
# for temporary connection negotiation purposes

# which address? 
# if you want to listen on all interfaces, use 0.0.0.0, this will
# bind to any available interface, loopback or otherwise

local_socket = Socket.new(:INET, :STREAM)
local_addr = Socket.pack_sockaddr_in(4481, '127.0.0.1')
local_socket.bind(local_addr)
# This socket will bind to the loopback interface and will only be listening for clients from localhost

any_socket = Socket.new(:INET, :STREAM)
any_addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')




