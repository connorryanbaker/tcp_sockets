# Step 4 - Accept Connections
require 'socket'

socket = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
socket.bind(addr)

socket.listen(5)

connection, _ = socket.accept

# accept is a blocking call. it will block the current thread
# until it receives a new connection. accept pops the next connection
# off of the listen queue and if they are present, else
# waits for a connection to be pushed on to it

# Socket#accept actually returns an Array of two elements
# first, the connection, second, an Addrinfo object representing the remote address of the client connection

# ex. Addrinfo.tcp('localhost',4481)
# useful methods, #ip_address, #ip_port

print 'Connection class: '
p connection.class

print 'Server fileno: '
p socket.fileno

print 'Connection fileno: '
p connection.fileno

print 'Local address: '
p connection.local_address

print 'Remote address: '
p connection.remote_address

# Connection class: Socket
# Server fileno: 7
# Connection fileno: 8
# Local address: #<Addrinfo: 127.0.0.1:4481 TCP>
# Remote address: #<Addrinfo: 127.0.0.1:49255 TCP>

# what is connection class?
# accept returns a 'connection', but connection is just an
# instance of Socket

# whats up with the file descriptors?
# #fileno is the kernel's method for keeping track of
# open files in the current process
# sockets (and everything) are files!
# the connection is a different instance of socket
# each successive connection is represented by a new socket object
# so the server can remain untouched and continue to accept connections


# whats up with the connection addresses
# tcp connections are defined by unique grouping of localhost,
# localport, remotehost, remoteport
# the combination of these properties must be unique for each
# connection
# we have initiated 2 simultaneous connections to localhost,
# but the port numbers are unique.


