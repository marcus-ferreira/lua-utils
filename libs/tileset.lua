---@class Tileset
Tileset = {}

---Creates a new Tileset
---@param atlasPath string
---@param tileWidth number
---@param tileHeight number
---@param numberTilesX number
---@param numberTilesY number
---@param offsetBorders? number
---@return Tileset
function Tileset:new(atlasPath, tileWidth, tileHeight, numberTilesX, numberTilesY, offsetBorders)
	---@class Tileset
	local tileset = {
		atlas = love.graphics.newImage(atlasPath),
		tileWidth = tileWidth,
		tileHeight = tileHeight,
		numberTilesX = numberTilesX,
		numberTilesY = numberTilesY,
		offsetBorders = offsetBorders or 0,
	}

	setmetatable(tileset, { __index = self })
	return tileset
end

function Tileset:getTileSize()
	return self.tileWidth, self.tileHeight
end

function Tileset:getCoordinates(tileX, tileY)
	return (tileX - 1) * 18, (tileY - 1) * 18
end

function Tileset:getTile(x, y)
	return x <= 0 and 1 or math.floor(x / self.tileWidth) + 1,
		y <= 0 and 1 or math.floor(y / self.tileHeight) + 1

end

---Populate the quads table of the Tileset
function Tileset:getQuads()
	local startX = 0
	local startY = 0
	local endX = self.tileWidth * self.numberTilesX
	local endY = self.tileHeight * self.numberTilesY
	local offsetX = self.tileWidth + self.offsetBorders
	local offsetY = self.tileHeight + self.offsetBorders
	local quads = {}

	for y = startY, endY - 1, offsetY do
		for x = startX, endX - 1, offsetX do
			local tile = love.graphics.newQuad(x, y, self.tileWidth, self.tileHeight, self.atlas:getDimensions())
			table.insert(quads, tile)
		end
	end

	return quads
end

function Tileset:draw()
end
