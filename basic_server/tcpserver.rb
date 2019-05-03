require 'socket'

server = TCPServer.new(4481)

# this is the equivalent of the following
# server = Socket.new(:INET, :STREAM)
# addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
# server.bind(addr)
# server.listen(5)

# TCPServer defaults to a listen queue of size 5
# TCPServer also returns two sockets, one listening
# for ipv4, one for ipv6

# Here we can also get around using loop to handle
# multiple connections

servers = Socket.tcp_server_sockets(4481)

Socket.accept_loop(server) do |connection|
  # handle connection
  connection.close
end

# We can also pass Socket#accept_loop multiple
# sockets

Socket.accept_loop(servers) do |connection|
  # handle connection
  connection.close
end

# An even more syntactic-sugar kind of way is
# to use Socket::tcp_server_loop, which is a wrapper
# around Socket.tcp_server_sockets and .accept_loop

Socket.tcp_server_loop(4481) do |connection|
  # handle connection
  connection.close
end
