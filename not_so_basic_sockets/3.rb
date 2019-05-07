require 'socket'

client = TCPSocket.new('localhost', 4481)
payload = 'Lorem ipsum' * 10000

begin
  loop do
    bytes = client.write_nonblock(payload)
    break if bytes >= payload.size
    p payload.slice!(0,bytes)
    p IO.select(nil,[client])
  end
rescue Errno::EAGAIN
  IO.select(nil,[client])
  retry
end

