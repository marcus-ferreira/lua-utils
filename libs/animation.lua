--[[
	Animation library

	Author: Marcus Ferreira
	Version: 1.0
]]--

---@class Animation
Animation = {}

---Creates a new Animation
---@param frames table # A table of the numbers of the frames in a quad list
---@param interval? number # The interval between frame quads, in seconds. The default value is the "interval" value of the class.
---@param loop? boolean # True if the animation should be looped or false if contrary. The default value is the "loop" value of the class.
---@return Animation animation # The new Animation object
function Animation:new(frames, interval, loop)
	---@class Animation
	local animation = {
		frames = frames,
		interval = interval or 1,
		loop = loop or false,
		timer = 0,
		currentFrame = 1,
	}
	setmetatable(animation, { __index = self })
	return animation
end

---Updates the Animation
---@param dt number
function Animation:update(dt)
	if #self.frames == 1 then return end

	self.timer = self.timer + dt

	if self.timer > self.interval then
		self.currentFrame = self.currentFrame + 1
		self.timer = self.timer - self.interval
	end

	if self.currentFrame > #self.frames then
		if self.loop then
			self.currentFrame = 1
		else
			self.currentFrame = #self.frames
		end
	end
end

---Gets the current frame of the animation (not the index)
---@return number # The frame of the animation
function Animation:getCurrentFrame()
	return self.frames[self.currentFrame]
end

---Checks if the animation has ended
---@return boolean # True if the last frame of the animation is playing
function Animation:isEnded()
	return self.currentFrame == #self.frames
end

---Sets the animation to loop or not
---@param boolean boolean # True to turn loop on, false to turn off
function Animation:setLoop(boolean)
	self.loop = boolean
end
