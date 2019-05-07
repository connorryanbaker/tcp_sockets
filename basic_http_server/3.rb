# Up till now, our server has returned a single response for each request
# Instead of adding more responses to our server directly, lets use a Rack app
# Our server will parse the HTTP requests and pass them to the Rack app
# The Rack app will return a response for the server to send back to the client


# In its simplest form, a Rack app is an object that responds to #call and 
# returns a 'triplet'- an array with 3 items, HTTP response, a hash of HTTP headers, and a body

app = Proc.new do |env|
  ['200', {'Content-Type' => 'text/html'}, ["Hola Cunao! The time is now #{Time.now"]]
end 

server = TCPServer.new(5678)

while session = server.accept 
  request = session.gets
  puts request

  # 1 get status code, headers, and body from triplet
  status, headers, body = app.call({})
  
  # 2 print status line with CRLF
  session.print "HTTP/1.1 #{status}\r\n"
  
  # 3 loop over headers and add a header line for each k/v pair
  headers.each do |key,value|
    session.print "#{key}: #{value}\r\n"
  end 

  # 4 print crlf to separate headers from body
  session.print "\r\n"
  
  # 5 loop over body and print out each part
  body.each do |part|
    session.print part
  end 
  session.close
end
