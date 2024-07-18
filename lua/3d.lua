
local config = {
	["canvas"] = {
		["size"] = {
			["x"] = 50,
			["y"] = 50
		}
	},
	["debug"] = true
}

--

require("luaplus")

local workspace = {

}

local line = {
	["queue"] = {

	}
}

local threed = {

}

local instance = {

}

--

function line.add(plota, plotb)
	line.queue[#line.queue+1] = {
		["a"] = plota,
		["b"] = plotb
	}
end

function threed.draw(filter)
	if filter=="*" then
		threed.draw("lines")
	elseif filter=="lines" then
		for i, line in pairs(line.queue) do
			local origin = {
				["x"] = 0,
				["y"] = 0
			}
			local plot = {
				["x"] = line.b.x-line.a.x,
				["y"] = (line.b.y-line.a.y)*-1
			}

			local thing = plot.x/plot.y
			print(thing)
			for y = 1, plot.y do
				for x = 1, plot.x do

				end
			end
		end
----end
	elseif filter==nil then
		error("Filter can not be empty, to draw all use threed.draw(\"*\")")
	else
		error("Unknown filter: "..filter)
	end
end

function instance.add(properties)
	workspace[#workspace+1] = properties
end

--debug inputs
if config.debug==true then
	local ans = nil

	print("config>canvas>size>x")
	ans = io.read()
	if type(tonumber(ans))=="number" then
		if tonumber(ans)>0 then
			config.canvas.size.x = ans
		else
			error(ans.." is not a valid natural number")
		end
	else
		error(ans.." is not a valid natural number")
	end

	print("config>canvas>size>y")
	ans = io.read()
	if type(tonumber(ans))=="number" then
		if tonumber(ans)>0 then
			config.canvas.size.y = ans
		else
			error(ans.." is not a valid natural number")
		end
	else
		error(ans.." is not a valid natural number")
	end

	print("add obj data | \"\" to escape | \"list\" to list workspace")
	ans = nil
	while ans~="" do
		ans = io.read()
		if ans~="list" then
			if ans~="" then
				local split = string.split(ans, "|")
				if split[1]~=nil or split[2]~=nil or split[3]~=nil then
					local prop = {
						["name"] = split[1],
						["size"] = {
							["x"] = string.split(split[2], ":")[1],
							["y"] = string.split(split[2], ":")[2],
							["z"] = string.split(split[2], ":")[3]
						},
						["position"] = {
							["x"] = string.split(split[3], ":")[1],
							["y"] = string.split(split[3], ":")[2],
							["z"] = string.split(split[3], ":")[3]
						}
					}
					instance.add(prop)
				else
					print("1 or more arguments are nil")
				end
				ans = nil
			end
		else
			for name, prop in pairs(workspace) do
				print(prop.name.."|"..prop.size.x..":"..prop.size.y..":"..prop.size.z..prop.position.x..":"..prop.position.y..":"..prop.position.z)
			end
			ans = nil
		end
	end
end

line.add({
	["x"] = 0,
	["y"] = 0
},{
	["x"] = 1,
	["y"] = 1
})

threed.draw("lines")

while true do

end
