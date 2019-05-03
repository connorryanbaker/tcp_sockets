# Step 3 - Listen
# server lifecycle, create, bind, listen, accept, close

require 'socket'

# steps 1 and 2: create a socket and bind it to port 4481
socket = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
socket.bind(addr)

# step 3, tell it to listen for oncoming connections
socket.listen(5)

# The integer argument to listen is the max pending connections
# the server socket will tolerate
# This list of pending connections is known as the *listen queue*

# How big should the listen queue be?
# Ultimately, having connections waiting in our listen queue is undesirable
# Users waiting for a response may indicate we need more server instances or a different architecture


