local lines = {}

--

function string.split(s, delimiter)
	if delimiter=="" then
		result = {}
		for i = 1, string.len(s) do
			table.insert(result, string.sub(s, i, i))
		end
		return result
	else
		result = {}
		for match in (s..delimiter):gmatch("(.-)"..delimiter) do
			table.insert(result, match)
		end
		return result
	end
end

function addtolines(cmd)
	local split = string.split(cmd, " ")
	local num = tonumber(split[1])
	if num~=nil then
		local fix = ""
		for i, v in pairs(split) do
			if i~=1 then
				if i~=2 then
					fix = fix.." "..v
				else
					fix = fix..v
				end
			end
		end
		lines[num] = fix
		print("INFO>", "wrote to "..num)
		return true
	end
	return false
end

function customcmdcheck(cmd)
	if cmd~=nil then
		if string.lower(cmd)=="home" then
			if not os.execute("cls") then
				os.execute("clear")
			end
			return true
		elseif string.lower(cmd)=="list" then
			local maxn = 1
			for i, v in pairs(lines) do
				if i>maxn then
					maxn = i
				end
			end
			print()
			for i = 1, maxn do
				local v = lines[i]
				if v~=nil then
					print(i..">", v)
				end
			end
			return true
		elseif string.lower(cmd)=="run" then
			local maxn = 1
			for i, v in pairs(lines) do
				if i>maxn then
					maxn = i
				end
			end
			local code = ""
			for i = 1, maxn do
				local v = lines[i]
				if v~=nil then
					if string.lower(v)~="home"then
						code = code.." "..v
					else
						code = code.." ".."os.execute(\"cls\")"
					end
					--[[
					if not customcmdcheck(v) then
						local success, response = pcall(function()
							loadstring(v)()
						end)
						if not success then
							local split = string.split(response, ": ")
							print("ERROR>", split[#split], split[#split-1])
							break
						end
					end
					--]]
				end
				loadstring(code)()
			end
			return true
		end
	end
	return false
end

--

while true do
	local command = io.read()
	if not addtolines(command) then
		if not customcmdcheck(command) then
			local success, response = pcall(function()
				loadstring(command)()
			end)
			if not success then
				local split = string.split(response, ": ")
				print("ERROR>", split[#split])
			end
		end
	end
end
