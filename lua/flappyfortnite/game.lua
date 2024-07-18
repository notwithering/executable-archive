local config = {
	["canvas"] = {
		["size"] = {
			["x"] = 953,
			["y"] = 162
		}
	},
	["characters"] = {
		["background"] = "∙",
		["pipe"] = "▓",
		
	}
}

function getlines(file)
	lines = {}
	for line in io.lines(file) do
		if line~="" then
			lines[#lines + 1] = line
		end
	end
	return lines
end

local flapper = getlines("flapper.txt")



local pipes = {
	[1] = {
		["x"] = 953,
		["y"] = 81
	}
}

local flapper = {
	["x"] = 100,
	["y"] = 112,
	["yvel"] = 0
}




function render()

end



while true do
	render()
end
