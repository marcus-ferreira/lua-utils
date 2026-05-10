--[[
	Author: Marcus Ferreira
	Description: A camera library for LOVE.
]]


--- Imports
local vector = require("src.libs.love.vector")


--- Library
---@class camera
local camera = {
	position    = vector.newVector2(),
	scale       = 1,
	rotation    = 0,
	followSpeed = 5
}


--- Methods
--- Moves the camera to follow a target inside the map bounds.
---@param x number The target X position.
---@param y number The target Y position.
---@param viewportWidth number The width of the viewport.
---@param viewportHeight number The height of the viewport.
---@param mapWidth number The total map width in pixels.
---@param mapHeight number The total map height in pixels.
---@param dt number The delta time.
function camera.follow(x, y, viewportWidth, viewportHeight, mapWidth, mapHeight, dt)
	local targetX = math.clamp(0, x - (viewportWidth / 2), mapWidth - viewportWidth)
	local targetY = math.clamp(0, y - (viewportHeight / 2), mapHeight - viewportHeight - 34)
	camera.moveTo(targetX, targetY, dt)
end

--- Moves the camera to a target position given x and y values.
---@param x number The X position target.
---@param y number The Y position target.
---@param dt number The delta time.
function camera.moveTo(x, y, dt)
	local target = vector.newVector2(x, y)
	local direction = target - camera.position
	local distance = direction:magnitude()
	if distance < 0.1 then
		camera.position = target
	else
		camera.position = camera.position + direction * (camera.followSpeed * dt)
	end
end

---Rotates the camera.
---@param dr number The amount to rotate the camera by.
function camera.rotate(dr)
	camera.rotation = camera.rotation + dr
end

---Setups the camera transformations.
function camera.set()
	love.graphics.push()
	love.graphics.scale(camera.scale, camera.scale)
	love.graphics.translate(-camera.position:getX(), -camera.position:getY())
	love.graphics.rotate(-camera.rotation)
end

---Sets the follow speed of the camera.
---@param speed number The follow speed of the camera.
function camera.setFollowSpeed(speed)
	camera.followSpeed = speed
end

---Sets the position of the camera.
---@param x number The X position of the camera.
---@param y number The Y position of the camera.
function camera.setPosition(x, y)
	camera.position:setCoordinates(x, y)
end

---Sets the scale of the camera.
---@param scale number The scale of the camera.
function camera.setScale(scale)
	camera.scale = scale
end

---Finishes the camera transformations.
function camera.unset()
	love.graphics.pop()
end

return camera
