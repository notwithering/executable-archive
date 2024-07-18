local LuaSocket = require("socket")
client = LuaSocket.connect("aternos.org", 80)
client:send("GET /panel/ajax/start.php?headstart=0&access-credits=0&SEC=373tpwlscfh00000:7cegg7ie0ni00000&TOKEN=7ukebasrV2xls7aL9ZNr HTTP/1.0\r\nHost: aternos.org\r\n\r\n")
while true do
	s, status, partial = client:receive('*a')
	print(s or partial)
	if status == "closed" then 
		break 
	end
end
client:close()
