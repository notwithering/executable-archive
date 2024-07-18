function clear()
	if not os.execute("clear") then
		if not os.execute("cls") then
			for i = 1, 255 do
				print()
			end
		end
	end
end

local people = {}

local sim = {}
function sim.step()
	for i, v in people do
		if v.state=="moving" then
			if math.random(1, 2)==1 then
				local axis = {"x", "y"}
				
			end
		elseif v.state=="resting" then
			
		end
	end
end
