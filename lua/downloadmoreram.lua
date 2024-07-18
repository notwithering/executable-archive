function wait(s)
	if not os.execute("sleep "..s.."s") then
		os.execute("timeout "..s)
	end
end

function clear()
	if not os.execute("clear") then
		os.execute("cls")
	end
end

function reboot()
	if not os.execute("reboot") then
		os.execute("shutdown /r")
	end
end

while true do
	print("How many gigabytes of RAM do you want to download?") 
	amt = tonumber(io.read())
	if amt~=nil and amt>=0 then
		amt = math.floor(amt)
		break
	else
		print("Not a whole number. \n")
	end
end

function bar(ratioa, ratiob, length)
	local chars = {
		["bar"] = "▓",
		["empty"] = "∙",
		["left"]  = "[",
		["right"] = "]"
	}
	
	local position = math.floor(ratioa/ratiob*length)
	local progress = math.floor(position*(100/length))
	local line = progress.."%"..chars.left
	
	if position>0 then
		for i = 1, position do
			line = line..chars.bar
		end
	end
	if length-position>0 then
		for i = 1, length-position do
			line = line..chars.empty
		end
	end
	line = line..chars.right
	print(line)
end

local progress = 0
while true do
	if progress==amt then
		break
	end
	
	clear()
	print("Downloading RAM...")
	bar(progress, amt, 50)
	wait(1)
	progress = progress + 1
end
reboot()
