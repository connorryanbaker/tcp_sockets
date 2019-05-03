require 'socket'

# Client Lifecycle
# Client takes the role of initiating connections with
# the server; it knows the location of the server
# and creates an outbound connection to it


# 1. create
# 2. bind
# 3. connect
# 4. close

# step 1 is the same

socket = Socket.new(:INET, :STREAM)

# step 2 - bind
# while it is rare for a server to omit its call to
# #bind, its rare for a client to make a call to bind.
# If the client socket omits its call to bind,
# it will be assigned a random port from the 
# ephemeral range.


# why not call bind?
# clients expect servers to be accessible at a certain# port number. clients don't call bind because no one
# needs to know what their port number is.
# don't bind client sockets to a port!


