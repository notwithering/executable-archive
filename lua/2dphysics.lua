while true do
	print("Choose a physics type. |Ridgid, Soft|")
	local types = {"ridgid", "soft"}
	local shape = string.lower(io.read())
	for i, v in pairs(types) do
		if shape==v then
			break
			print("k")
		end
	end
end
