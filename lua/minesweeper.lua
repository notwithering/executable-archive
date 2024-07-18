local config = {
	["characters"] = {
		["unopened"] = "#",
		["mine"] = "*"
	},
	["zeroIsBlank"] = true,
	["flagSuffix"] = "*"
}

--

local ingame = false

local ans = ""

local height = 0
local width = 0
local mines = 0

--

local function render()

end

--

while true do
	if ingame then

	else
		print("how tall should the thiungy be 2-26")
		ans = io.read()
		height = tonumber(ans)
		print("ok how fat 2-26")
		ans = io.read()
		width = tonumber(ans)
		print("how many mines")
		ans = io.read()
		mines = tonumber(ans)
		ingame = true
	end
end

--
