require("luaplus")

local canvas = {
	["width"] = 50,
	["height"] = 50,
	["pixel"] = "██"
}

function background(color)
	local write = ""
	for collumn = 1, canvas.width do
		write = write..canvas.pixel
	end
	for line = 1, canvas.height do
		move.pos(line, 0)
		io.write(format.color(write, color))
	end
end

clear()
background("#000000")
io.read()
