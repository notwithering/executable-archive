require("luaplus")

local frame = {}
local add = {}
function add.pixel(x, y, color)
	if type(x)~="number" then error("Argument #1 invalid.") end
	if type(y)~="number" then error("Argument #2 invalid.") end
	if type(color)~="string" then error("Argument #3 invalid.") end
	move.save()
	move.pos(y, x*2-1)
	io.write(format.invert(format.color("  ", color)))
	move.restore()
end
function frame.clear(sizex, sizey, color)
	if type(sizex)~="number" then error("Argument #1 invalid.") end
	if type(sizey)~="number" then error("Argument #2 invalid.") end
	if type(color)~="string" then error("Argument #3 invalid.") end
	move.save()
	for y = 1, sizey do
		for x = 1, sizex do
			move.pos(y, x*2-1)
			io.write(format.invert(format.color("  ", color)))
		end
	end
	move.restore()
end

clear()

frame.clear(25,25,"#000000")

add.pixel(10,10,"#ffe5b4")
add.pixel(8,10,"#ffe5b4")
add.pixel(9,9,"#ffe5b4")
add.pixel(9,8,"#ffc0cb")

move.pos(26,1)
