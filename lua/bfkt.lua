function split(s)
	result = {}
	for i = 1, string.len(s) do
		table.insert(result, string.sub(s, i, i))
	end
	return result
end

function table.clone(t)
	local new = {}
	for i, v in pairs(t) do
		new[i] = v
	end
	return new
end

local numlinelength = 128

local numline = {}
for i = 1, numlinelength do
	numline[i] = 0
end

local position = 1

function checkidentifier(cmd)
	local commands = {}
	local cit = {
		["typ"] = "" ,
		["increment"] = 0
	}
	
	local letters = split(cmd)
	for i, v in pairs(letters) do
		if v=="w" then
			local cur = {}
			cur["typ"] = "add"
			cur["increment"] = 1
			commands[#commands+1] = cur
		elseif v=="s" then
			local cur = {}
			cur["typ"] = "add"
			cur["increment"] = -1
			commands[#commands+1] = cur
		elseif v=="a" then
			local cur = {}
			cur["typ"] = "mov"
			cur["increment"] = -1
			commands[#commands+1] = cur
		elseif v=="d" then
			local cur = {}
			cur["typ"] = "mov"
			cur["increment"] = 1
			commands[#commands+1] = cur
		end
	end
	return commands
end
function run(cit) --cit = checkidentifier table
	for i, v in pairs(cit) do
		if v.typ=="mov" then
			local newpos = position+v.increment
			if newpos>0 and newpos<=numlinelength then
				position = newpos
			end
		elseif v.typ=="add" then
			numline[position] = numline[position] + v.increment
		else
			error("invalid")
		end
	end
end

--

io.write("WELCOME MESSAGE\n\n")

while true do
	io.write("> ")
	local command = io.read()
	local check = checkidentifier(command)
	run(check)
	io.write(table.concat(numline, ", ").."\n".."pos: "..position.."\n")
end
