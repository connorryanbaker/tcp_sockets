require 'socket'

server = TCPServer.new(5678)

while session = server.accept
  request = session.gets
  puts request
  
  session.print "HTTP/1.1 200\r\n"
  session.print "Content-Type: text/html\r\n"
  session.print "\r\n"
  session.print "Hola cunao! The time is #{Time.now}"
  
  session.close
end
