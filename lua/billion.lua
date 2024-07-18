local starttime = os.time()
function count()
	local countto = 1000000000
	local counttolen = string.len(tostring(countto))
	local prevlength = 0
	for i = 1, countto do
		local length = string.len(tostring(i))
		if prevlength~=length then
			prevlength = length
			print(length.."/"..counttolen)
		end
	end
end
count()
local endtime = os.time()

local timetook = endtime-starttime

io.write("Operation took "..timetook.."s")
