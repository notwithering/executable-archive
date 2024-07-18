local socket = require("socket")

local server = socket.bind("*", 8080) -- binds the server to the IP address and port

while true do
  local client = server:accept() -- waits for a client to connect
  client:send("Hello, World!") -- sends a message to the client
  client:close() -- closes the connection
end

