--[[
	Author: Marcus Ferreira
	Description: A animation library for LOVE.

	10/06/2025 - 0.2.2v
]]


---@class Animation
Animation = {}
Animation.__index = Animation


---@param image love.Image # The image to be used.
---@param tileColumns number # The number of the tiles in a row.
---@param tileRows number # The number of the tiles is a collums.
---@param left? number # Where to start to draw from left. Default = 0.
---@param top? number # Where to start to draw from top. Default = 0.
---@param offsetX? number # The margin in between tiles collumns. Default = 0.
---@param offsetY? number # The margin in between tiles rows. Default = 0.
---@return table grid # The Grid object.
function love.graphics.newGrid(image, tileColumns, tileRows, left, top, offsetX, offsetY)
	tileWidth  = image:getWidth() / tileColumns
	tileHeight = image:getHeight() / tileRows
	left       = left or 0
	top        = top or 0
	offsetX    = offsetX or 0
	offsetY    = offsetY or 0


	local self = {}
	for y = top, tileHeight * tileRows - 1, tileHeight + offsetY do
		for x = left, tileWidth * tileColumns - 1, tileWidth + offsetX do
			local tile = love.graphics.newQuad(
				x, y, tileWidth, tileHeight, tileWidth * tileColumns, tileHeight * tileRows
			)
			table.insert(self, tile)
		end
	end
	return self
end

---@param image love.Image # The image to be used.
---@param frames table # A table of the numbers of the quads in order.
---@param interval? number # The interval between frame quads, in seconds. Default = 1.
---@param loop? boolean # True if the animation should be looped or false if contrary. Default = true.
---@return Animation animation # The new Animation object.
function Animation.newAnimation(image, grid, frames, originX, originY, interval, loop)
	originX  = originX or 0
	originY  = originY or 0
	interval = interval or 1
	loop     = loop == nil and true or false


	---@class Animation
	local self             = setmetatable({}, Animation)
	self.image             = image
	self.grid              = grid
	self.frames            = frames
	self.currentFrameIndex = 1
	self.originX           = originX
	self.originY           = originY
	self.interval          = interval
	self.loop              = loop
	self.timer             = 0
	self.states            = {
		PLAYING = 1,
		STOPPED = 2
	}
	self.currentState      = self.states.PLAYING
	return self
end

---@param dt number
function Animation:update(dt)
	-- Don't update if there's only 1 frame
	if #self.frames == 1 then return end

	if self:isPlaying() then
		self.timer = self.timer + dt

		-- Changes to next frame and reset timer
		if self.timer > self.interval then
			self.currentFrameIndex = self.currentFrameIndex + 1
			self.timer = self.timer - self.interval
		end

		-- Goes back to first frame if is looping or stop
		if self.currentFrameIndex > #self.frames then
			if self.loop then
				self.currentFrameIndex = 1
			else
				self.currentFrameIndex = #self.frames
				self:stop()
			end
		end
	end
end

---@param x number # The X position of the animation.
---@param y number # The Y position of the animation.
---@param rotation? number # The rotation value of the animation.
---@param sx? number # The scaleX of the animation.
---@param sy? number # The scaleY of the animation.
function Animation:draw(x, y, rotation, sx, sy)
	rotation = rotation or 0
	sx = sx or 1
	sy = sy or 1

	love.graphics.draw(
		self.image,                  -- image
		self.grid[self:getCurrentFrame()], -- quad
		x,                           -- x
		y,                           -- y
		rotation,                    -- rotation
		sx,                          -- scaleX
		sy,                          -- scaleY
		self.originX,                -- originX
		self.originY                 -- originY
	)
end

---Gets the current frame (quad) of the animation (not the index)
---@return love.Quad # The frame of the animation
function Animation:getCurrentFrame()
	return self.frames[self.currentFrameIndex]
end

---@param frameIndex number # The index of the frame to go.
function Animation:goToFrame(frameIndex)
	self.currentFrameIndex = frameIndex
end

---@return boolean # True if the last frame of the animation is playing
function Animation:isEnded()
	return self.currentFrameIndex == #self.frames
end

function Animation:isPlaying()
	return self.currentState == self.states.PLAYING
end

function Animation:play()
	self.currentFrameIndex = 1
	self.currentState = self.states.PLAYING
end

function Animation:resume()
	self.currentState = self.states.PLAYING
end

---@param boolean boolean # True to turn loop on, false to turn off
function Animation:setLoop(boolean)
	self.loop = boolean
end

function Animation:stop()
	self.currentState = self.states.STOPPED
end
