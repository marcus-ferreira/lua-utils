---Creates a quad list from a atlas image
---@param atlas love.Image # The spritesheet to be used
---@param tileWidth number # The quad width 
---@param tileHeight number # The quad height
---@param startX? number # The x coordinate of the start of the quads on the atlas. Default is 0
---@param startY? number # The y coordinate of the start of the quads on the atlas. Default is 0
---@param endX? number # The x coordinate of the end of the quads on the atlas. Default is atlas width
---@param endY? number # The y coordinate of the end of the quads on the atlas. Default is atlas height
---@param offsetBorders? number # The spacing in pixels to be added between the quads. Default is 0
---@return table # A quads table in order. Each quad is a love.Quad
function GenerateQuads(atlas, tileWidth, tileHeight, startX, startY, endX, endY, offsetBorders)
	startX = startX or 0
	startY = startY or 0
	endX = endX or atlas:getWidth()
	endY = endY or atlas:getHeight()
	offsetBorders = offsetBorders or 0

	local quads = {}
	for y = startY, endY - 1, tileHeight + offsetBorders do
		for x = startX, endX - 1, tileWidth + offsetBorders do
			local tile = love.graphics.newQuad(x, y, tileWidth, tileHeight, atlas:getDimensions())
			table.insert(quads, tile)
		end
	end
	return quads
end
