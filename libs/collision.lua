---@class RectangleCollider
RectangleCollider = {}

function RectangleCollider:new(x, y, width, height)
	---@class RectangleCollider
	local rectangleCollider = {}
	rectangleCollider.x = x
	rectangleCollider.y = y
	rectangleCollider.width = width
	rectangleCollider.height = height

	setmetatable(rectangleCollider, { __index = self })
	return rectangleCollider
end

---Check if is colliding with another RectangleCollider.
---@param rectangleCollider RectangleCollider # The RectangleCollider to check.
---@return boolean # True if the RectangleColliders are colliding, false on contrary.
function RectangleCollider:isColliding(x, y, rectangleCollider)
	return x < rectangleCollider.x + rectangleCollider.width and
		y < rectangleCollider.y + rectangleCollider.height and
		x + self.width > rectangleCollider.x and
		y + self.height > rectangleCollider.y
end
