--[[
	Author: Marcus Ferreira
	29/04/2025 - 0.1.1v - Fix some texts
]]

---@class Camera
Camera = {}
Camera.__index = Camera

---Creates a new Camera object
---@param x any # X position of the camera
---@param y any # Y position of the camera
---@param scale any # Scale of the camera
---@return Camera # A new Camera object
function Camera.new(x, y, scale)
	---@type Camera
	local self = setmetatable({}, Camera)
	self.x = x or 0
	self.y = y or 0
	self.scale = scale or 1
	self.rotation = 0
	return self
end

function Camera:set()
	love.graphics.push()
	love.graphics.scale(self.scale, self.scale)
	love.graphics.translate(-self.x, -self.y)
	love.graphics.rotate(-self.rotation)
end

function Camera:unset()
	love.graphics.pop()
end

function Camera:moveTo(targetX, targetY, dt)
	local speed = 5
	self.x = self.x + (targetX - self.x) * speed * dt
	self.y = self.y + (targetY - self.y) * speed * dt
end

function Camera:rotate(dr)
	self.rotation = self.rotation + dr
end

function Camera:setPosition(x, y)
	self.x = x
	self.y = y
end

function Camera:setScale(scale)
	self.scale = scale
end
