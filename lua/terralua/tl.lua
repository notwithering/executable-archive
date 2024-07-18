require("luaplus")

local config = {
	["pixel"] = string.invert(string.color("  "))
}

local add = {}
function add.pixel()
	io.write()
end
