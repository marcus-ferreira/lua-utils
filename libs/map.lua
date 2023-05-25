--[[
	Version: 0.1.0
]]

---@class Map
Map = {}

function Map:new(tileWidth, tileHeight, data)
	---@class Map
	local map = {}
	map.width = #data[1]
	map.height = #data
	map.tileWidth = tileWidth
	map.tileHeight = tileHeight
	map.data = data
	

	setmetatable(map, { __index = self })
	return map
end

function Map:draw()
	for y = 1, self.height do
		for x = 1, self.width do
			if self.data[y][x] ~= 0 then
				love.graphics.rectangle("line",
					(x - 1) * self.tileWidth, (y - 1) * self.tileHeight,
					self.tileWidth, self.tileHeight)
			end
		end
	end
end
