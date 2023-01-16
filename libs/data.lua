---Save the actual game in a serialized data file
---@param file string # The filename where the game will be saved
---@param gameData table # The table of the data to be saved
function SaveGame(file, gameData)
	local data = table.serialize(gameData)
	love.filesystem.write(file, data)
end

---Load data
---@param file string # The filename to be loaded
---@return table | nil data # The table of tables of the data loaded
function LoadGame(file)
	local data = love.filesystem.read(file)
	if data == nil then return end
	return table.unserialize(data)
end
