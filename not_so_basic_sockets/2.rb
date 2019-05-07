require 'socket'

# Non-blocking IO
# different from asynchronous/evented io
# goes hand in hand with multiplexing connections


# for a read opetation that will never block, we use #read_nonblock
# #read_nonblock takes an integer argument specifying max bytes to be read

# Socket.tcp_server_loop(4481) do |connection|
#   loop do
#     begin
#       puts connection.read_nonblock(4096)
#     rescue Errno::EAGAIN
#       retry
#     rescue EOFError
#       break
#     end
#   end
#   connection.close
# end
# 
# # EAGAIN - file marked for non-blocking io, no data ready to be read
# # retrying over and over again on blocking is not the best look
# # the below implementation is a cleaner way to retry a blocked read
# 
# 
# Socket.tcp_server_loop(4481) do |connection|
#   IO.select
#   begin
#     connection.read_nonblock(4096)
#   rescue ERRNO::EAGAIN
#     IO.select([connection])
#     retry
#   end
# end

# Calling IO.select with an Array of sockets will block until one of the sockets becomes readable
# IO.select gives us the ability to monitor multiple sockets and periodically check for readability while doing other work


# Non-blocking writes
# possibly for #write_nonblock to return a partial write, while #write will write all data
client = TCPSocket.new('localhost', 4481)
payload = 'hola cunao' * 10000
written = client.write_nonblock(payload)
p written == payload.size
