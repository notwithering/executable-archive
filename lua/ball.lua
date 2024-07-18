local config = {
	["canvas"] = {
		["xsize"] = 20,
		["ysize"] = 10,
		["background"] = "#",
		["ball"] = "O"
	},
	["stepping"] = {
		["waittime"] = 0
	}
}
--functions

local function printcanvas(xpos, ypos)
	for i = 1, config.canvas.ysize do
		print("")
	end

	for y = 1, config.canvas.ysize do
		local row = ""
		for x = 1, config.canvas.xsize do
			if  y==ypos+1 and x==xpos+1 then
				row = row..config.canvas.ball
			else
				row = row..config.canvas.background
			end
		end
		print(row)
	end
end

function wait(seconds)
	local start = os.time()
	repeat until os.time() > start + seconds
end


--script
local ball = {
	["velocity"] = {
		["x"] = 1,
		["y"] = 1
	},
	["position"] = {
		["x"] = 0,
		["y"] = 0
	}
}


while true do
	--wait(config.stepping.waittime)
	io.read()
	if ball.position.x+1+ball.velocity.x>config.canvas.xsize then
		ball.velocity.x = -ball.velocity.x
	end
	if ball.position.y+1+ball.velocity.y>config.canvas.ysize then
		ball.velocity.y = -ball.velocity.y
	end
	if ball.position.x+ball.velocity.x<0 then
		ball.velocity.x = -ball.velocity.x
	end
	if ball.position.y+ball.velocity.y<0 then
		ball.velocity.y = -ball.velocity.y
	end
	ball.position.x = ball.position.x + ball.velocity.x
	ball.position.y = ball.position.y + ball.velocity.y
	printcanvas(ball.position.x, ball.position.y)
end
