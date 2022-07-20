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

	function collider:update(dt)
		self.x = x
		self.y = y
	end

	function collider:draw()
		love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	end

	return collider
end
