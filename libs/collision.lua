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
-- 	local x2 = x + self.width
-- 	local y2 = y + self.height
-- 	rectangleCollider.x2 = rectangleCollider.x + rectangleCollider.width
-- 	rectangleCollider.y2 = rectangleCollider.y + rectangleCollider.height

-- 	return x <= rectangleCollider.x2 and y <= rectangleCollider.y2 and
-- 		x2 >= rectangleCollider.x and y2 >= rectangleCollider.y
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
