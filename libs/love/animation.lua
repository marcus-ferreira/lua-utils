--[[
	Author: Marcus Ferreira
	Description: A animation library for LOVE.

	10/06/2025 - 0.2.2v
]]


---@class animation
animation = {}

---@class Grid
Grid = {}
Grid.__index = Grid

---@class Animation
Animation = {}
Animation.__index = Animation


---@param tileWidth number # The width of a tile.
---@param tileHeight number # The height of a tile.
---@param tileColumns? number # The number of tile columns. Default = 1
---@param tileRows? number # The number of tile rows. Default = 1.
---@param left? number # Where to start to draw from left. Default = 0.
---@param top? number # Where to start to draw from top. Default = 0.
---@param offsetX? number # The margin in between tiles collumns. Default = 0.
---@param offsetY? number # The margin in between tiles rows. Default = 0.
---@return Grid grid # The Grid object.
function Grid.new(tileWidth, tileHeight, tileColumns, tileRows, left, top, offsetX, offsetY)
	tileColumns = tileColumns or 1
	tileRows = tileRows or 1
	left = left or 0
	top = top or 0
	offsetX = offsetX or 0
	offsetY = offsetY or 0

	---@class Grid
	local self = setmetatable({}, Grid)
	self.tileWidth = tileWidth
	self.tileHeight = tileHeight
	self.quads = {}
	for y = top, tileHeight * tileRows - 1, tileHeight + offsetY do
		for x = left, tileWidth * tileColumns - 1, tileWidth + offsetX do
			local tile = love.graphics.newQuad(
				x, y, tileWidth, tileHeight, tileWidth * tileColumns, tileHeight * tileRows
			)
			table.insert(self.quads, tile)
		end
	end
	return self
end

---@return number
function Grid:getTileWidth()
	return self.tileWidth
end

---@return number
function Grid:getTileHeight()
	return self.tileHeight
end


---@param image love.Image # The image to be used.
---@param grid Grid # The Grid object to be used.
---@param frames table # A table of the numbers of the frames in a quad list.
---@param interval? number # The interval between frame quads, in seconds. Default = 1.
---@param loop? boolean # True if the animation should be looped or false if contrary. Default = true.
---@return Animation animation # The new Animation object.
function Animation.new(image, grid, frames, interval, loop)
	---@class Animation
	local self             = setmetatable({}, Animation)
	self.image             = image
	self.grid              = grid
	self.frames            = frames
	self.currentFrameIndex = 1
	self.interval          = interval or 1
	self.loop              = loop == nil and true or false
	self.timer             = 0
	self.originX           = self.grid.tileWidth / 2
	self.originY           = self.grid.tileHeight / 2
	self.states            = {
		PLAYING = 1,
		STOPPED = 2
	}
	self.currentState      = self.states.STOPPED
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
function Animation:draw(x, y, rotation, flip)
	love.graphics.draw(
		self.image,                        -- image
		self.grid.quads[self:getCurrentFrame()], -- quad
		x,                                 -- x
		y,                                 -- y
		rotation or 0,                     -- rotation
		flip == true and -1 or 1,          -- scaleX
		1,                                 -- scaleY
		self.originX,                      -- originX
		self.originY                       -- originY
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
