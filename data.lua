---Save data
---@param file string # The filename
---@param data table # The table of the data to be saved
function love.filesystem.saveData(file, data)
	if not love.filesystem.getInfo(file) then love.filesystem.write(file, "") end

	for key, value in pairs(data) do
		love.filesystem.append(file, key .. "=" .. value .. "\n")
	end
end

---Load data
---@param file string # The filename to be loaded
---@return table[] # The table of tables of the data loaded
function love.filesystem.loadData(file)
	local data = {}

	if not love.filesystem.getInfo(file) then love.filesystem.write(file, "") end

	for line in love.filesystem.lines(file) do
		local sep = string.find(line, "=")
		local key = string.sub(line, 1, sep - 1)
		local value = string.sub(line, sep + 1)
		table.insert(data, { key .. sep .. value })
	end

	return data
end
