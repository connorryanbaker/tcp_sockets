require 'socket'

socket = TCPSocket.new('google.com', 80)
# Socket::Option represents the type of the socket
opt = socket.getsockopt(Socket::SOL_SOCKET, Socket::SO_TYPE)

opt.int == Socket::SOCK_STREAM # => true, integer representation of the option compared to integer stored in Socket::SOCK_STREAM
opt.int == Socket::SOCK_DGRAM # => false

# SO_REUSE_ADDR
# The SO_REUSE_ADDR option tells the kernel its ok for another socket to bind to the same
# local address that the server is using if its currently in the TCP TIME_WAIT state

# wtf is the TIME_WAIT state
# when you close a socket that has pending data in its buffers, the kernel leaves the connection open
# long enough for the data to be sent out. it has to send data, wait for the ack, etc.
# if you close a server with pending data and try to immediately reboot the server, this will be an
# effort to bind a socket to the same address. setting SO_REUSE_ADDR will allow you to bind to an address
# still in use by another socket in this TIME_WAIT state


server = TCPServer.new('localhost',4481)
server.setsockopt(:SOCKET, :REUSEADDR, true)

# TCPServer.new, Socket.tcp_server_loop enable this option by default
