function string.split(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function wait(sec)
	os.execute("sleep "..tostring(sec))
end

math.randomseed(1)

local x = 10
local y = 1
local chanceofblankline = 1

local chars = string.split("$ @ B % 8 & W M # * o a h k b d p q w m Z O 0 Q L C J U Y X z c v u n x r j f t / \\ | ( ) 1 { } [ ] ? - _ + ~ < > i ! l I ; : , \" ^ ` \' .", " ")

local formula = 1/(chanceofblankline/100)

while true do
	for i = 1, y do
		local line = ""
		if math.random(1, formula)~=1 then
			for ii = 1, x do
				line = line..chars[math.random(1, #chars)]
			end
		end
		print(line)
	end
end
