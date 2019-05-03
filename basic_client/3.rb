require 'socket'

# The lower level construction of a client

# socket = Socket.new(:INET, :STREAM)
# addr = Socket.pack_sockaddr_in(80, 'google.com')
# socket.connect(addr) 

# the ruby way

Socket.tcp('google.com', 80) do |connection|
  connection.write "GET / HTTP/1.1\r\n"
  connection.close
end
