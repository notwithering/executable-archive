require("luaplus")

local prevcols = 0
local prevlines = 0

while true do
	local cols = infoget.cols()
	local lines = infoget.lines()
	
	if cols~=prevcols or lines~=prevlines then
	
		local cm = "cols   :  "..cols
		local lm = "lines  :  "..lines
		--local um = "Enter to up update values."
		
		clear()
		move.pos(math.round(lines/2)-1, math.round((cols/2)-(string.len(cm)/2))+1)
		io.write(cm)
		move.pos(math.round(lines/2)+1, math.round((cols/2)-(string.len(cm)/2))+1)
		io.write(lm)
		--[[
		move.pos(math.round(lines/2), math.round((cols/2)-(string.len(um)/2))+1)
		io.write(um)
		io.read()
		]]
		
		prevcols = cols
		prevlines = lines
	end
end
