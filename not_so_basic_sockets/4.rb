require 'socket'

# Non-blocking accept

# #accept_nonblock - while #accept just pops a connection off of the listen queue,
# if the queue is empty, it blocks execution

# in this case, #accept_nonblock raises an Errno::EAGAIN rather than blocking


server = TCPServer.new('localhost',4481)

loop do
  begin
    connection = server.accept_nonblock
  rescue Errno:EAGAIN
    # do other important stuff
    retry
  end
end

# Non-blocking connect
# whereas other operations raise an exception, if #connect_nonblock cannot reach a remote host
# it raises Errno::EINPROGRESS and continues in the background

socket = Socket.new(:INET, :STREAM)
remote_addr = Socket.pack_sockaddr_in(80, 'google.com')
begin
  socket.connect_noblock(remote_addr)
rescue Errno::EINPROGRESS
  # operation in progress
rescue Errno::EALREADY
  # a previous nonblocking connect is already in progress
rescue Errno::ECONNREFUESED
  # remote host refused connection
end
