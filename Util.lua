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
function IsColliding(a, b)
	return a.x < b.x + b.width and
		a.y < b.y + b.height and
		b.x < a.x + a.width and
		b.y < a.y + a.height
end

---Creates a table of quads
---@param atlas love.Image
---@param tw number
---@param th number
function love.graphics.newQuads(atlas, tw, th)
	local quads = {}
	for y = 0, atlas:getHeight() - 1, th do
		for x = 0, atlas:getWidth() - 1, tw do
			local tile = love.graphics.newQuad(x, y, tw, th, atlas:getDimensions())
			table.insert(quads, tile)
		end
	end
	return quads
end
