--[[
	Version: 0.1.0
]]

require("libs.grid")

---@class Tileset
Tileset = {}

---Creates a new Tileset
---@param image love.Image
---@param grid Grid
---@return Tileset
function Tileset:new(image, grid)
	---@class Tileset
	local tileset = {}
	tileset.image = image
	tileset.grid = grid

	setmetatable(tileset, { __index = self })
	return tileset
end

function Tileset:getCoordinates(tileX, tileY) return (tileX - 1) * 18, (tileY - 1) * 18 end

function Tileset:getTile(x, y)
	local _x = math.floor(x / self.grid.tileWidth) + 1
	local _y = math.floor(y / self.grid.tileHeight) + 1
	return _x, _y
end

function Tileset:getTileSize() return self.grid.tileWidth, self.grid.tileHeight end

function Tileset:draw()
end
