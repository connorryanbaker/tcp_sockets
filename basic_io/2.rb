require 'socket'

# The major workhorse method of writing to sockets is appropriately titled #write

Socket.tcp_server_loop(4481) do |connection|
  connection.write("hola cunao!")
  connection.close
end

# Buffering
# Questions - How much data to be read/wrote in one call? If write returns successfully does that mean the other end received my data?
# Should a big write be split into many small writes?

# #write returning without raising an exception means that your data has been left in the hands of the ruby IO system and the os kernel
# there is at least one layer of buffers beween app code and network hardware. why buffer at all?
# sending data accross a network is slow. buffering allows write to return almost immediately. the kernel can then collect all pending writes
# and optimize when they are sent for maximum performance. 
# when writing data to sockets, we typically optimize performance by writing everything in one go.

# Reads are buffered as well! Net::HTTP, Passenger, Unicorn, Puma all use readpartial(1024 * 16) for 16kb read buffers
# when we specify read length, the os kernel allocates some memory for us. we want to optimize, allocating no more than we need.
