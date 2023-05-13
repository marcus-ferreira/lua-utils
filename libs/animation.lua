--[[
	Animation library

	Author: Marcus Ferreira
	Version: 1.1
]]--

---@class Grid
Grid = {}

---Creates a new Grid, a list of Quads.
---@param image love.Image
---@param tileWidth number
---@param tileHeight number
---@return Grid
function Grid:new(image, tileWidth, tileHeight)
	---@class Grid
	local grid = {}
	grid.image = image

	for y = 0, grid.image:getHeight() - 1, tileHeight do
		for x = 0, grid.image:getWidth() - 1, tileWidth do
			local tile = love.graphics.newQuad(x, y, tileWidth, tileHeight, grid.image:getDimensions())
			table.insert(grid, tile)
		end
	end

	setmetatable(grid, { __index = self })
	return grid
end

---@class Animation
Animation = {}

---Creates a new Animation.
---@param grid Grid # The Grid to be used.
---@param frames table # A table of the numbers of the frames in a quad list.
---@param interval? number # The interval between frame quads, in seconds. The default value is the "interval" value of the class.
---@param loop? boolean # True if the animation should be looped or false if contrary. The default value is the "loop" value of the class.
---@return Animation animation # The new Animation object
function Animation:new(grid, frames, interval, loop)
	---@class Animation
	local animation = {}
	animation.grid = grid
	animation.frames = frames
	animation.indexCurrentFrame = 1
	animation.interval = interval or 1
	animation.loop = loop or false
	animation.timer = 0

	setmetatable(animation, { __index = self })
	return animation
end

---Updates the Animation
---@param dt number
function Animation:update(dt)
	-- don't update if there's only 1 frame
	if #self.frames == 1 then return end

	-- increases timer over time
	self.timer = self.timer + dt

	-- change to next frame and reset timer
	if self.timer > self.interval then
		self.indexCurrentFrame = self.indexCurrentFrame + 1
		self.timer = self.timer - self.interval
	end

	-- go back to first frame
	if self.indexCurrentFrame > #self.frames then
		if self.loop then
			self.indexCurrentFrame = 1
		else
			self.indexCurrentFrame = #self.frames
		end
	end
end

function Animation:draw(x, y)
	love.graphics.draw(self.grid.image, self.grid[self:getCurrentFrame()], x, y)
end

---Gets the current frame of the animation (not the index)
---@return love.Quad # The frame of the animation
function Animation:getCurrentFrame()
	return self.frames[self.indexCurrentFrame]
end

---Checks if the animation has ended
---@return boolean # True if the last frame of the animation is playing
function Animation:isEnded()
	return self.indexCurrentFrame == #self.frames
end

---Sets the animation to loop or not
---@param boolean boolean # True to turn loop on, false to turn off
function Animation:setLoop(boolean)
	self.loop = boolean
end

function Animation:goToFrame(frameNumber)
	self.indexCurrentFrame = frameNumber
end
