---Creates a collider
---@param object any # The object reference
---@param x? number # The X position
---@param y? number # The Y position
---@param width? number # The collider width
---@param height? number # The collider height
---@param originX? number # The collider origin X
---@param originY? number # The collider origin Y
---@return Collider # The collider
function love.graphics.newCollider(object, x, y, width, height, originX, originY)
	---@class Collider
	local collider = {}
	collider.x = x or 0
	collider.y = y or 0
	collider.width = width or 0
	collider.height = height or 0
	collider.originX = originX or 0
	collider.originY = originY or 0

	---Check if the collider is colliding with an object with AABB detection
	---@param object table # The object with an x and width parameters
	---@return boolean # Returns true if is colliding
	function collider:isColliding(object)
		return self.x < object.x + object.width and
			self.y < object.y + object.height and
			object.x < self.x + self.width and
			object.y < self.y + self.height
	end

	function collider:update(dt)
	end

	function collider:draw()
		love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	end

	return collider
end

