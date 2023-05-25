--[[
	Version: 0.1.0
]]

require("libs.table")

---@class data
data = {}

function data.save(fileName, gameData)
	love.filesystem.write(fileName, table.serialize(gameData))
end

function data.load(fileName)
	local fileString = love.filesystem.read(fileName)
	if fileString == nil then return end
	return table.deserialize(fileString)
end
