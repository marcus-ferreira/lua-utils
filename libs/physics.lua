--[[
	Author: Marcus Ferreira
	Version: 0.2.0
	Date: 18/10/2024
]]


---@class physics
physics = {}

---@class RectangleCollider
RectangleCollider = {}
RectangleCollider.__index = RectangleCollider

---@class CircleCollider
CircleCollider = {}
CircleCollider.__index = CircleCollider


---Creates a new RectangleCollider.
---@param world love.World
---@param x number
---@param y number
---@param width number
---@param height number
---@param type? love.BodyType
---@return RectangleCollider
function physics.newRectangleCollider(world, x, y, width, height, type)
	---@class RectangleCollider
	local self = setmetatable({}, RectangleCollider)
	self.body = love.physics.newBody(world, x, y, type or "static")
	self.body:setFixedRotation(true)
	self.shape = love.physics.newRectangleShape(width, height)
	self.fixture = love.physics.newFixture(self.body, self.shape)
	self.fixture:setFriction(0)
	return self
end

---Creates a new CircleCollider.
---@param world love.World
---@param x number
---@param y number
---@param radius number
---@param type? love.BodyType
---@return CircleCollider
function physics.newCircleCollider(world, x, y, radius, type)
	---@class CircleCollider
	local self = setmetatable({}, CircleCollider)
	self.body = love.physics.newBody(world, x, y, type or "static")
	self.body:setFixedRotation(true)
	self.shape = love.physics.newCircleShape(radius)
	self.fixture = love.physics.newFixture(self.body, self.shape)
	self.fixture:setFriction(0)
	return self
end

---Draws the rectangle collider.
function RectangleCollider:draw()
	love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
end

---Gets the width and height of the collider.
---@return number width # The collider width.
---@return number height # The collider height.
function RectangleCollider:getSize()
	local x1, y1, x2, _, _, _, _, y4 = self.body:getWorldPoints(self.shape:getPoints())
	local width = x2 - x1
	local height = y4 - y1
	return width, height
end

---Gets the collider width.
---@return number width
function RectangleCollider:getWidth()
	local width, _ = self:getSize()
	return width
end

---Gets the collider height.
---@return number height
function RectangleCollider:getHeight()
	local _, height = self:getSize()
	return height
end

---Draws the circle collider.
function CircleCollider:draw()
	love.graphics.circle("line", self.body:getX(), self.body:getY(), self.shape:getRadius())
end

---Gets the collider radius.
function CircleCollider:getRadius()
	return self.shape:getRadius()
end
