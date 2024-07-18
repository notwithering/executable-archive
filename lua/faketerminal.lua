require("luaplus")

local config = {
	["fti"] = format.bold(format.color("! ","#ff0000")),
	["user"] = {
		["username"] = "withering",
		["hostname"] = "away"
	},
	["colors"] = {
		["user"] = "#26a269",
		["path"] = "#12488b"
	},
	["path"] = "~/Documents/executable/lua"
}

function readycommand()
	io.write(
		config.fti
		..
		format.bold(format.color(config.user.username.."@"..config.user.hostname, config.colors.user))
		..
		format.bold(":")
		..
		format.bold(format.color(config.path, config.colors.path))
		..
		"$ "
	)
end

clear()

while true do
	readycommand()
	local cmd = io.read()
	if cmd=="end" then
		break
	else
		os.execute(cmd)
	end
end
