require("luaplus")

local pieces = {
	["white"] = {
		[1] = "♙",
		[2] = "♗",
		[3] = "♘",
		[4] = "♖",
		[5] = "♕",
		[6] = "♔"
	},
	["black"] = {
		[1] = "♟",
		[2] = "♝",
		[3] = "♞",
		[4] = "♜",
		[5] = "♛",
		[6] = "♚"
	},
	["background"] = {
		["white"] = "░",
		["black"] = "▓"
	}
}
local board = {}
local letters = {"A", "B", "C", "D", "E", "F", "G", "H"}
for i = 1, 8 do
	board[letters[i]] = {}
	for ii = 1, 8 do
		board[letters[i]][ii] = {
			["type"] = nil,
			["color"] = nil
		}
	end
end
--[[
░▓░▓░▓░▓░
▓░▓░▓░▓░▓
░▓░▓░▓░▓░
▓░▓░▓░▓░▓
░▓░▓░▓░▓░
▓░▓░▓░▓░▓
♟♟♟♟♟
▓░▓░▓░▓░▓
--]]
