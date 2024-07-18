require("luaplus")

function getdata()
	local lines = file.lines("data")
	for i, v in pairs(lines) do 
		local split = string.split(v, "\\\\")
		local house = split[1]
		local owner = split[2] or ''

		lines[i] = {
			["house"] = house,
			["owner"] = owner
		}
	end
	return lines
end
local housings = getdata()

while true do
	clear()
	io.write("\'S\'=Search, \'A\'=Add Entry".."\n")
	local ans = io.read()
	if ans=="s" or ans=="S" then
		clear()
		io.write("Type name of housing.\n\nSearch: ")
		local name = string.lower(io.read())
		
		local results = {}
		for i, v in pairs(housings) do
			if string.find(string.lower(v.house), name) then
				results[#results+1] = v
			end
		end
		if #results==1 then
			clear()
			io.write("1 result found.\n")
		else
			io.write(#results.." results found.\n\n")
		end
		for i, v in pairs(results) do
			io.write("House: "..v.house.."\nOwner: "..v.owner.."\n\n")
		end
		io.read()
	elseif ans=="a" or ans=="A" then
		
	elseif ans=="" then
		break
	end
end
