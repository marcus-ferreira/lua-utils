--[[
	Version: 0.1.0
]]

---@class RectangleCollider
RectangleCollider = {}

---Creates a new RectangleCollider
---@param world love.World
---@param x number
---@param y number
---@param width number
---@param height number
---@param type? love.BodyType
---@return RectangleCollider
function RectangleCollider:new(world, x, y, width, height, type)
	---@class RectangleCollider
	local rectangleCollider = {}
	rectangleCollider.body = love.physics.newBody(world, x, y, type or "static")
	rectangleCollider.body:setFixedRotation(true)
	rectangleCollider.shape = love.physics.newRectangleShape(width, height)
	rectangleCollider.fixture = love.physics.newFixture(rectangleCollider.body, rectangleCollider.shape)
	rectangleCollider.fixture:setFriction(0)

	setmetatable(rectangleCollider, { __index = self })
	return rectangleCollider
end

---Draws the rectangle collider
function RectangleCollider:draw() love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints())) end

---Gets the width and height of the collider
---@return number width # The collider width
---@return number height # The collider height
function RectangleCollider:getSize()
	local x1, y1, x2, _, _, _, _, y4 = self.body:getWorldPoints(self.shape:getPoints())
	local width = x2 - x1
	local height = y4 - y1

	return width, height
end

---Gets the collider width
---@return number width
function RectangleCollider:getWidth()
	local width, _ = self:getSize()
	return width
end

---Gets the collider height
---@return number height
function RectangleCollider:getHeight()
	local _, height = self:getSize()
	return height
end

---@class CircleCollider
CircleCollider = {}

---Creates a new CircleCollider
---@param world love.World
---@param x number
---@param y number
---@param radius number
---@param type? love.BodyType
---@return CircleCollider
function CircleCollider:new(world, x, y, radius, type)
	---@class CircleCollider
	local circleCollider = {}
	circleCollider.body = love.physics.newBody(world, x, y, type or "static")
	circleCollider.body:setFixedRotation(true)
	circleCollider.shape = love.physics.newCircleShape(radius)
	circleCollider.fixture = love.physics.newFixture(circleCollider.body, circleCollider.shape)
	circleCollider.fixture:setFriction(0)

	setmetatable(circleCollider, { __index = self })
	return circleCollider
end

---Draws the circle collider
function CircleCollider:draw() love.graphics.circle("line", self.body:getX(), self.body:getY(), self.shape:getRadius()) end
