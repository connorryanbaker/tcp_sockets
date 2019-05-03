# Step 5 - Close our Connection

require 'socket'

server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)

server.listen(5)

loop do
  connection, _ = server.accept
  p connection
  connection.close
end

# Why is close needed?
# Resource usage 
# Open file limit (an extension of resource usage)

# we have two other close methods
# connection.close_read
# connection.close_write
# closing the write stream will send an EOF to the other
# end of a socket

