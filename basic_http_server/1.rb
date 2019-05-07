require 'socket'

# HTTP is a req-res protocol that describes how servers exchange data with HTTP clients/web browsers. 
# HTTP uses TCP as its transfer protocol - many say an HTTP server is a TCP server that "speaks" HTTP

server = TCPServer.new('localhost',5678)

while session = server.accept
  session.puts "Hola cunao! The time is #{Time.now}"
  session.close
end

# A client for this server could look like this...

socket = TCPSocket.new('localhost',5678)
while line = socket.gets
  puts line
end

socket.close

# What does a typical HTTP GET request look like?
# GET / HTTP/1.1/\r\n
# A request-line without any additional headers or request body

# Request Line contains 4 parts
# 1. Method Token (GET)
# 2. Request-URI (/)
# 3. Protocol-Version (HTTP/1.1)
# 4. CRLF, carriage-return line-feed, \r followed by \n to indicate the end of a line


# What does a typical response look like?
# HTTP/1.1 200\r\nContent-Type: text/html\r\n\r\n\Hello world!

# Response consists of 4 parts
# 1. Status Line: Protocol Version, space, response's status code(200), terminated by CRLF \r\n
# 2. Optional header line(s), separated by CRLF if more than one. Here the header is Content-type: text/html
# 3. New Line/double CRLF to separate status and header from body(\r\n\r\n)
# 4. The response body
