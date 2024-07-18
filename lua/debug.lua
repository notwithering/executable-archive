print("FILE NAME?")
local ans = io.read()

while true do
	os.execute("clear")
	print("PRESS ENTER TO RUN")
	io.read()
	os.execute("clear")
	os.execute("lua "..ans)
end
