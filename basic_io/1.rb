require 'socket'

# Socket.tcp_server_loop(4481) do |connection|
#   puts connection.read
#   connection.close
# end

# Socket has IO as a parent class, read, write, flush etc are all methods accessible to Sockets.
# As previously discussed, this means of processing connections is far from optimal, as the server will never finish reading data and never exit.
# For example, if we tail our system's log and pipe it to our server with tail -f /var/log/system.log | nc localhost 4481
# The call to #read will continue blocking until the client finishes sending data, which it may never.
# We can adjust our approach by specifying a particular length for the server to read from the connection...

one_kb = 1024

Socket.tcp_server_loop(4481) do |connection|
  while data = connection.read(one_kb) do
    puts data
  end
  connection.close
end

# Passing an integer to read tells the connection to stop reading and return the data once it has read a certain amount.
# We loop over the read method, calling it until no data is returned
# We can still imagine a situation where we find ourselves waiting for the integer cap of data to be hit, if a client
# sends 500 bytes of data and we are waiting, etc. How can we get around this!?


# The EOF Event
# end-of-file! usually refered to as a 'character', EOF can be understood as a state-like event, like shutdown() or close()
# The simplest way for a client to send an EOF is to close its socket.

client = TCPSocket.new('localhost', 4481) 
client.write('hola cunao!')
client.close


# Another option to avoid the lazy behavior of #read, waiting as long as possible before returning the data, until it hits min length or receives EOF,
# is a method that takes the opposite approach, #readpartial.
# Calls to readpartial return the available data immediately, even if it receives less data than we have instructed the server to read


one_hundred_kb = one_kb * 100

Socket.tcp_server_loop(4481) do |connection|
  while data = connection.readpartial(one_hundred_kb) do
    puts data
  end
rescue EOFError
  connection.close
end

# we call because readpartial will raise an EOFERROR exception when it receives EOF.
