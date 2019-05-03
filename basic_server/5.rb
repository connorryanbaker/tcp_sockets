# The Accept Loop

require 'socket'

# Consider the following example

# server = Socket.new(:INET, :STREAM)
# addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
# server.bind(addr)

# server.listen(5)

# connection, _ = server.accept

# accept returns one connection and exits
# how can we listen for incoming connections continually?
# with a loop!
server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(5)

# here we enter an endless loop of accepting and handling
# connections

loop do
  connection, _ = server.accept
  # here we would do something with the connection
  connection.close
end

# a common way to write certain kinds of servers in ruby
