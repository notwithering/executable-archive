require("luaplus")

local config = {
	["max"] = {
		["lines"] = 14,
		["characters"] = 255,
		["pages"] = 50
	},
	["lines"] = file.lines("text.txt")
}

function clicker()
	os.execute("xdotool click 1")
end

function typer(msg)
	os.execute("xdotool type --clearmodifiers '"..msg.."'")
end

function enterkey()
	os.execute("xdotool key Return")
end

local total = {
	["characters"] = 0,
	["pages"] = 1,
	["lines"] = 1
}

local currentpage = {
	["characters"] = 0,
	["lines"] = 1
}

wait(5)

for lineindex, line in pairs(config.lines) do
	local words = string.split(line, " ")
	for wordindex, word in pairs(words) do
		if currentpage.characters+string.len(word)>=config.max.characters then
			clicker()
			total.pages = total.pages+1
			currentpage.characters = 0

			if total.pages==50 then
				--	
			end
		else
			io.write(currentpage.characters,"\n")
		end

		typer(word.." ")
		currentpage.characters = currentpage.characters+string.len(word)+1
		total.characters = total.characters+string.len(word)+1
	end

	enterkey()
	currentpage.lines = currentpage.lines+1
	total.lines = total.lines+1
end
