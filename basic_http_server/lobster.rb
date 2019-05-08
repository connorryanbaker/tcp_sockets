require 'socket'
require 'rack'
require 'rack/lobster'

app = Rack::Lobster.new
server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request
  
  method, full_path = request.split(' ')
  path, query = full_path.split('?')
  
  # Here, we split the request string and send it to Rack
  # The method / path are found by splitting on a space
  # The path and query are found by splitting on a ?
  # We pass these values to our app in a Rack environment hash
  # Rack apps take one argument, called the environment and return an 
  # array of 3 values: the status, the headers and the body
  
  status,headers,body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_STRING' => query
  })
  
  session.print "HTTP/1.1 #{status}\r\n"
  
  headers.each do |k,v|
    session.print "#{k}: #{v}\r\n"
  end 

  session.print "\r\n"
  
  body.each do |part|
    session.print part
  end 
  session.close
end
