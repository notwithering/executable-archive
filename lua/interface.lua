require("luaplus")

--[[info
		screen info
	resoloution is 100x50

		sprite creation info
	local sprites = {
		["_zindex_"] = { --(smallest zindex number is in front and biggest zindex is at the back)
			["type"] = "_rectangle, text,_",
			["size"] = {["x"] = _1-100_, ["y"] = _1-50_}, --(ONLY FOR RECTANGLE TYPE)
			["position"] = {["x"] = _0-99_, ["y"] = _0-49_},
			["brightness"] = _0-9_, --(0=black, 9=white) --(ONLY FOR RECTANGLE TYPE)
			["text"] = "_text_" --(ONLY FOR TEXT TYPE)
		}
	}
		extra info
	no capitals are allowed for anything internal (that the user can interact with such as type size or position for sprites as the user may change those values remoteley)
--]]
--variables
local storage = {}
local brightnesslevels = {" ",".",":","-","=","+","*","#","%","@"}
local sprites = {}
local processes = {
	["apps"] = {},
	["background"] = {}
}
--functions
function render()
	for i = 1, 50 do
		print()
	end

	for y = 0, 49 do
		local line = ""

		local text = 0

		for x = 0, 99 do
			local found = false
			if text==0 then
				for i, spr in pairs(sprites) do
					if spr.type=="rectangle" then
						local xmin = spr.position.x
						local xmax = xmin+(spr.size.x-1)
						local ymin = spr.position.y
						local ymax = ymin+(spr.size.y-1)

						if x>=xmin and x<=xmax then
							if y>=ymin and y<=ymax then
								if not found then
									line = line..brightnesslevels[spr.brightness+1]
									found = true
								end
							end
						end
					elseif spr.type=="text" then
						local xmin = spr.position.x
						local spry = spr.position.y

						if x==xmin then
							if y==spry then
								if not found then
									line = line..spr.text
									found = true
									text = string.len(spr.text)-1
								end
							end
						end
					end
				end
			else
				text = text-1
			end
		end

		print(line)
	end
end
function newsprite(typ, zindex, pos, size, brightness, text)
	if typ=="rectangle" then
		sprites[zindex] = {
			["type"] = "rectangle",
			["size"] = {["x"] = size.x, ["y"] = size.y},
			["position"] = {["x"] = pos.x, ["y"] = pos.y},
			["brightness"] = brightness
		}
	elseif typ=="text" then
		sprites[zindex] = {
			["type"] = "text",
			["position"] = {["x"] = pos.x, ["y"] = pos.y},
			["text"] = text
		}
	end
end
processes.background._desktop = {}
processes.background._desktop.zindexes = {}
processes.background._desktop.established = false
function processes.background.desktop(action)
	local split = string.split(action, " ")
	if action=="start" then
		if processes.background._desktop.established==false then
			processes.background._desktop.established = true
			local zindexes = processes.background._desktop.zindexes

			zindexes[#zindexes+1] = #sprites+1000
			newsprite("text", #sprites+1000, {["x"]=0,["y"]=0}, nil, nil, "DESKTOP APPS:")

			local linecount = 1
			for i, v in pairs(storage.A.Users.Default.Desktop) do
				zindexes[#zindexes+1] = #sprites+1001
				newsprite("text", #sprites+1001, {["x"]=0,["y"]=linecount}, nil, nil, i)
				linecount = linecount + 1
			end

			--

			zindexes[#zindexes+1] = #sprites+999
			newsprite("rectangle", #sprites+999, {["x"]=0,["y"]=0}, {["x"]=100,["y"]=50}, 1, nil)
		end
	elseif action=="kill" then
		if processes.background._desktop.established==true then
			processes.background._desktop.established = false
			for i, v in pairs(processes.background._desktop.zindexes) do
				sprites[v] = nil
			end
		end
	elseif split[1]=="open" then
		if split[2]~=nil then
			local task = storage.Users.Default.Desktop[split[2]]
			task[1](task[2])
		end
	end
end
--script
	--startup
 storage = {
	["A"] = {
		["Users"] = {
			["Default"] = {
				["Desktop"] = {
					["killdesktop"] = {processes.background.desktop, "kill"}
				}
			}
		}
	}
}
processes.background.desktop("start")
while true do
	render()
	local cmd = io.read()
	if cmd=="killall" then
		for i, v in pairs(processes.background) do
			if type(v)=="function" then
				v("kill")
			end
		end
		for i, v in pairs(processes.apps) do
			if type(v)=="function" then
				v("kill")
			end
		end
	else
		for i, v in pairs(processes.background) do
			if type(v)=="function" then
				if processes.background["_"..i].established==true then
					v(cmd)
				end
			end
		end
		for i, v in pairs(processes.apps) do
			if type(v)=="function" then
				if processes.background["_"..i].established==true then
					v(cmd)
				end
			end
		end
	end
end
