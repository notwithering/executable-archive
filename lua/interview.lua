function table.clone(t)
	local copy = {}
	for i, v in pairs(t) do
		copy[i] = v
	end
	return copy
end

function secondlargest(t)
	local tc = table.clone()
	table.sort(tc)
	return tc[2]
end

print(secondlargest({1,2,3}))
