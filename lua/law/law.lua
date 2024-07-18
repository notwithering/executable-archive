require("luaplus")

local datafile = "data.txt"

--

local page = "HOME"

function getlines(file)
	lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
	return lines
end

local data = {}
function data.get()
	local got = {
		["easy"] = {},
		["normal"] = {},
		["hard"] = {}
	}
	local lines = getlines(datafile)
	for i, v in pairs(lines) do
		local par = string.split(v, ":")

		local dif = par[1]
		local que = par[2]
		local lon = par[3]
		local sho = par[4]

		got[dif][#got[dif]+1] = {
			["question"] = que,
			["longest"] = lon,
			["shortest"] = sho
		}
	end
	return got
end
data["data"] = data.get(datafile)
function data.write()
	local file = io.open(datafile, "w")

	local txt = ""

	for i, v in pairs(data.data.easy) do
		local dif = "easy"
		local que = v.question
		local lon = v.longest
		local sho = v.shortest
		if txt~="" then
			txt = txt.."\n"..dif..":"..que..":"..lon..":"..sho
		else
			txt = txt..dif..":"..que..":"..lon..":"..sho
		end
	end
	for i, v in pairs(data.data.normal) do
		local dif = "normal"
		local que = v.question
		local lon = v.longest
		local sho = v.shortest
		if txt~="" then
			txt = txt.."\n"..dif..":"..que..":"..lon..":"..sho
		else
			txt = txt..dif..":"..que..":"..lon..":"..sho
		end
	end
	for i, v in pairs(data.data.hard) do
		local dif = "hard"
		local que = v.question
		local lon = v.longest
		local sho = v.shortest
		if txt~="" then
			txt = txt.."\n"..dif..":"..que..":"..lon..":"..sho
		else
			txt = txt..dif..":"..que..":"..lon..":"..sho
		end
	end
	file:write(txt)

	file:close()
end

function show(pag)
	if pag=="HOME" then
		print("1 = SEARCH")
		print("2 = ADD")
		print("3 = DATA")
		print("4 = RAW")
		print()

		local choice = tonumber(io.read())

		if choice==1 then
			page = "SEARCH"
		elseif choice==2 then
			page = "ADD"
		elseif choice==3 then
			page = "DATA"
		elseif choice==4 then
			page = "RAW"
		end
	elseif pag=="SEARCH" then
		print("WHAT DIFFICULTY?")
		local dif = string.lower(io.read())
		local difs = {
			"easy",
			"normal",
			"hard"
		}
		if not table.find(difs, dif) then
			print("NOT A DIFFICULTY")
			print("ENTER TO GO TO HOME")
			io.read()
			page = "HOME"
		else
			local spacing = "	"
			while true do
				print("SEARCH QUESTION:")
				local que = string.lower(io.read())
				if que=="" then
					break
				end
				print()
				local search = {}
				for i, v in pairs(data.data[dif]) do
					local words = string.split(que, " ")
					local yes = true
					for i, vv in pairs(words) do
						if not string.find(v.question, que) then
							yes = false
						end
					end
					if yes==true then
						search[#search+1] = v
					end
				end

				if #search==0 then
					 print("NO QUESTION FOUND")
				else
					print(#search.." QUESTIONS FOUND")

					for i, vv in pairs(search) do
						print(vv.question)
						print(spacing..vv.longest)
						print(spacing..vv.shortest)
						print()
					end
				end
				print("<---------->")
			end
			page = "HOME"
		end
	elseif pag=="ADD" then
		print("1 = WRITE TO LONGEST")
		print("2 = WRITE TO SHORTEST")
		local typ = tonumber(io.read())
		print()
		if typ==1 or typ==2 then
			print("1 = EASY")
			print("2 = NORMAL")
			print("3 = HARD")
			local dif = tonumber(io.read())
			print()
			if dif==1 or dif==2 or dif==3 then
				if dif==1 then
					dif = "easy"
				elseif dif==2 then
					dif = "normal"
				elseif dif==3 then
					dif = "hard"
				end

				print("QUESTION:")
				local que = string.lower(io.read())
				print()

				local lon
				if typ==1 then
					print("LONGEST:")
					lon = string.lower(io.read())
				else lon="null" end
				if typ==2 then
					print("SHORTEST:")
					sho = string.lower(io.read())
				else sho = "null" end
				print()
				data.data[dif][#data.data[dif]+1] = {
					["question"] = que,
					["longest"] = lon,
					["shortest"] = sho
				}
				data.write()
			else
				print("NOT A DIFFICULTY")
				print("ENTER TO GO TO HOME")
				io.read()
				page = "HOME"
			end
		else
			if typ~="" then
				print("NOT A TYPE")
				print("ENTER TO GO TO HOME")
				io.read()
				page = "HOME"
			else
				page = "HOME"
			end
		end
	elseif pag=="DATA" then
		local spacing = "	"
		print("EASY:")
		for i, v in pairs(data.data.easy) do
			print(spacing..v.question)
			print(spacing..spacing..v.longest)
			print(spacing..spacing..v.shortest)
		end
		print("NORMAL:")
		for i, v in pairs(data.data.normal) do
			print(spacing..v.question)
			print(spacing..spacing..v.longest)
			print(spacing..spacing..v.shortest)
		end
		print("HARD:")
		for i, v in pairs(data.data.hard) do
			print(spacing..v.question)
			print(spacing..spacing..v.longest)
			print(spacing..spacing..v.shortest)
		end

		print()
		print("ENTER TO GO TO HOME")
		io.read()
		page = "HOME"
	elseif pag=="RAW" then
		local lines = getlines(datafile)
		for i, v in pairs(lines) do
			print(i..".     "..v)
		end

		print()
		print("ENTER TO GO TO HOME")
		io.read()
		page = "HOME"
	else
		print("PAGE NOT FOUND")
		print("ENTER TO GO TO HOME")
		io.read()
		page = "HOME"
	end
end

while true do
	print("<-------------------------------------------------->")
	print("CURRENT: "..page)
	print()
	show(page)
end
