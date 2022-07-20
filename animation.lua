---Creates a table of Quads
---
---The purpose of a Quad is to use a fraction of an image to draw objects, as opposed to drawing entire image. It is most useful for sprite sheets and atlases: in a sprite atlas, multiple sprites reside in same image, quad is used to draw a specific sprite from that image; in animated sprites with all frames residing in the same image, quad is used to draw specific frame from the animation.
---@param atlas love.Image # The image used for the reference.
---@param tileWidth number # The width of the tile.
---@param tileHeight number # The height of the tile.
---@param startX? number # The first X position
---@param startY? number # The first Y position
---@param endX? number # The last X position
---@param endY? number # The last Y position
---@return love.Quad[] quad # The table of Quads.
function love.graphics.newQuads(atlas, tileWidth, tileHeight, startX, startY, endX, endY)
	local quads = {}

	for y = startY or 0, endY - 1 or atlas:getHeight() - 1, tileHeight do
		for x = startX or 0, endX - 1 or atlas:getWidth() - 1, tileWidth do
			local tile = love.graphics.newQuad(x, y, tileWidth, tileHeight, atlas:getDimensions())
			table.insert(quads, tile)
		end
	end

	return quads
end

---Creates a new animation
---@param spriteSheet love.Image # The image reference
---@param quadTable love.Quad[] # The quad table of the animation
---@return Animation
function love.graphics.newAnimation(spriteSheet, quadTable)
	---@class Animation
	local animation = {}

	animation.timer = 0
	animation.speed = 10
	animation.loop = false
	animation.frames = quadTable
	animation.currentFrame = 1

	function animation:update(dt)
		self.timer = self.timer + dt

		if self.timer > self.speed then
			if self.currentFrame < #self.frames then
				self.currentFrame = self.currentFrame + 1
			else
				self.currentFrame = 1
			end
			self.timer = 0
		end
	end

	function animation:draw()
	end

	return animation
end
