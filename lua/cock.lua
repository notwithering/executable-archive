require("luaplus")

function cock(e)
	local a = 1
	while true do
		clear()
		print(e)
		progress.bar(a,100,50)
		if a==100 then
			break
		end
		a = a +1
		wait(0.1)
	end
end
