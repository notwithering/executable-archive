function check(n, multiple)
	if n%multiple==0 then
		return true
	end
	return false
end

local sep = "\n"

local countup = 100
for i = 1, countup do
	local fizz = check(i, 3)
	local buzz = check(i, 5)
	
	if fizz then
		if not buzz then
			io.write("Fizz"..sep)
		else
			io.write("FizzBuzz"..sep)
		end
	elseif buzz then
		io.write("Buzz"..sep)
	else
		io.write(i..sep)
	end
end
