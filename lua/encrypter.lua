require("luaplus")

clear()

local welcome = [[
                                  _             __
  ___ _ __   ___ _ __ _   _ _ __ | |_ ___ _ __ / _|_ __ ___  ___
 / _ | '_ \ / __| '__| | | | '_ \| __/ _ | '__| |_| '__/ _ \/ _ \
|  __| | | | (__| |  | |_| | |_) | ||  __| |  |  _| | |  __|  __/
 \___|_| |_|\___|_|   \__, | .__/ \__\___|_|  |_| |_|  \___|\___|
                      |___/|_|
]]
io.write(welcome.."\n")


function encrypt(file, key0)
	local key = string.split(key0, "")
end
function decrypt(file, key0)
	
end


local info = {}
io.write("file name?\n")
info.file = io.read()

