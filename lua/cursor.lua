local mouse = {}
function mouse.position()
	local command = "xdotool getmouselocation --shell"
	local output = os.execute(command)
	local xPos, yPos = string.match(output, "X=(%d) Y=(%d)")
	xPos = tonumber(xPos)
	yPos = tonumber(yPos)
	return xPos, yPos
end

print(mouse.position())
