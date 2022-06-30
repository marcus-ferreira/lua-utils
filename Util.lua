--[[
	List of utility functions
	
	Author: Marcus Ferreira
	github.com/marcus-ferreira
	
	v0.2
]]


---Creates a table of Quads
---
---The purpose of a Quad is to use a fraction of an image to draw objects, as opposed to drawing entire image. It is most useful for sprite sheets and atlases: in a sprite atlas, multiple sprites reside in same image, quad is used to draw a specific sprite from that image; in animated sprites with all frames residing in the same image, quad is used to draw specific frame from the animation.
---@param atlas love.Image # The image used for the reference.
---@param width number # The width of the tile.
---@param height number # The height of the tile.
---@return love.Quad[] quad # The table of Quads.
function love.graphics.newQuads(atlas, width, height)
	local sheet = {}
	for y = 0, atlas:getHeight() - 1, height do
		for x = 0, atlas:getWidth() - 1, width do
			local tile = love.graphics.newQuad(x, y, width, height, atlas:getDimensions())
			table.insert(sheet, tile)
		end
	end
	return sheet
end

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

---Creates a sliced table
---@param tbl table # The table to be sliced
---@param first? number # The first index of the sliced table
---@param last? number # The last index of the sliced table
---@return table table # The sliced table
function table.slice(tbl, first, last)
	local sliced = {}
	for i = first or 1, last or #tbl do table.insert(sliced, tbl[i]) end
	return sliced
end

---Check if an object is colliding other with AABB detection
---@param a table # The first object
---@param b table # The second object
---@return boolean # Returns true if is colliding
function isColliding(a, b)
	return a.x < b.x + b.width and
		a.y < b.y + b.height and
		b.x < a.x + a.width and
		b.y < a.y + a.height
end
