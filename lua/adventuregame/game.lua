local config = {
	["characters"] = {
		["background"] = "·",

		["player"] = "ඞ",

		["rock"] = "ᨏ",
		["tree"] = {["base"]="▒",["trunk"]="░",["leaves"]="▓"},

		["axe"] = "ℙ",
		["stick"] = "╱",
	},
	["plane"] = {
		["size"] = {
			["x"] = 39,
			["y"] = 39
		}
	},
	["inventory"] = {
		
	}
}



--GAME
local plane = {} --plane[x][y]
for i = 1, 39 do --x
	plane[i] = {}
	for ii = 1, 39 do --y
		plane[i][ii] = {}
	end
end



function generatePlane(seed)
	math.randomseed(seed)
	
	local things = {
		["ground"] = {
			["trees"] = {["amt"]=math.random(0, 5)},
			["rocks"] = {["amt"]=math.random(0, 10)}
		}
	}	
	for i = 0, things.ground.trees.amt do
		things.ground.trees[i] = {["x"]=math.random(1,39),["y"]=math.random(1,39)}
	end
	for i, v in pairs(things.ground.trees) do
		if i~="amt" then
			plane[v.x][v.y] = {
				["type"] = "tree",
				["height"] = math.random(3,10)
			}
		end
	end
	for i = 0, things.ground.rocks.amt do
		things.ground.rocks[i] = {["x"]=math.random(1,39),["y"]=math.random(1,39)}
	end
	for i, v in pairs(things.ground.rocks) do
		if i~="amt" then
			plane[v.x][v.y] = {
				["type"] = "rock"
			}
		end
	end
	
end

local game = {
	["animate"] = {
		[1] = {
			["name"] = "Player",
			["position"] = {["x"]=20,["y"]=20},
			["inventory"] = {}
		}
	},
	["inanimate"] = {},
}


function printPlane()
	local printed = {} --printed[x][y]
	for x = 1, 39 do --x
		printed[x] = {}
		for y = 1, 39 do --y
			printed[x][y] = {}
		end
	end	


	for x, v in pairs(plane) do
		for y, v in pairs(v) do
			if v.type=="tree" then
				printed[x][y] = config.characters.tree.base
				for i = 1, v.height do
					for xx, vv in pairs(plane) do
						for yy, vv in pairs(plane) do
							if xx==x and yy==y+i then
								printed[xx][yy] = config.characters.tree.trunk
							end 
						end
					end	
				end
			elseif v.type=="rock" then
				printed[x][y] = config.characters.rock
			else
				printed[x][y] = config.characters.background
			end
		end
	end
	for i, v in pairs(game.animate) do
		printed[v.position.x][v.position.y] = config.characters.player
	end

	for y = 1, 39 do
		local line = {}
		for x = 1, 39 do
			line[x] = printed[x][y]
		end
		print(" "..table.concat(line, " ").." ")
	end
end



generatePlane(os.time())
printPlane()

