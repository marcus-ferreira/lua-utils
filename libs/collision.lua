-- ---@class RectangleCollider
-- RectangleCollider = {}

-- function RectangleCollider:new(x, y, width, height)
-- 	---@class RectangleCollider
-- 	local rectangleCollider = {}
-- 	rectangleCollider.x = x
-- 	rectangleCollider.y = y
-- 	rectangleCollider.width = width
-- 	rectangleCollider.height = height

-- 	setmetatable(rectangleCollider, { __index = self })
-- 	return rectangleCollider
-- end

-- ---Check if is colliding with another RectangleCollider.
-- ---@param rectangleCollider RectangleCollider # The RectangleCollider to check.
-- ---@return boolean # True if the RectangleColliders are colliding, false on contrary.
-- function RectangleCollider:isColliding(x, y, rectangleCollider)
-- 	return x < rectangleCollider.x + rectangleCollider.width and
-- 		y < rectangleCollider.y + rectangleCollider.height and
-- 		x + self.width > rectangleCollider.x and
-- 		y + self.height > rectangleCollider.y
-- end

-- function RectangleCollider:draw()
-- 	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
-- end

-- ---@class CircleCollider
-- CircleCollider = {}

-- function CircleCollider:new(x, y, radius)
-- 	---@class CircleCollider
-- 	local circleCollider = {}
-- 	circleCollider.x = x
-- 	circleCollider.y = y
-- 	circleCollider.radius = radius

-- 	setmetatable(circleCollider, { __index = self })
-- 	return circleCollider
-- end

-- ---Check if is colliding with another CircleCollider.
-- ---@param circleCollider CircleCollider # The CircleCollider to check.
-- ---@return boolean # True if the CircleColliders are colliding, false on contrary.
-- function CircleCollider:isColliding(x, y, circleCollider)
-- 	local distX = x - circleCollider.x
-- 	local distY = y - circleCollider.y
-- 	local distTotal = math.sqrt(math.pow(distX, 2) + math.pow(distY, 2))

-- 	return distTotal < self.radius + circleCollider.radius
-- end

-- function CircleCollider:draw()
-- 	love.graphics.circle("line", self.x, self.y, self.radius)
-- end




--[[
	Using physics
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
	rectangleCollider.shape = love.physics.newRectangleShape(width, height)
	rectangleCollider.fixture = love.physics.newFixture(rectangleCollider.body, rectangleCollider.shape)
	
	rectangleCollider.body:setFixedRotation(true)
	rectangleCollider.fixture:setFriction(0)

	setmetatable(rectangleCollider, { __index = self })
	return rectangleCollider
end

function RectangleCollider:draw()
	love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
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
	circleCollider.shape = love.physics.newCircleShape(radius)
	circleCollider.fixture = love.physics.newFixture(circleCollider.body, circleCollider.shape)
	
	circleCollider.body:setFixedRotation(true)
	circleCollider.fixture:setFriction(0)

	setmetatable(circleCollider, { __index = self })
	return circleCollider
end

function CircleCollider:draw()
	love.graphics.circle("line", self.body:getX(), self.body:getY(), self.shape:getRadius())
end
