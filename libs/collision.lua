--[[
	Version: 0.1.2
]]

---@class Rectangle
Rectangle = {}
Rectangle.__index = Rectangle

---@class Circle
Circle = {}
Circle.__index = Circle

---Creates a new Rectangle.
---@param x number
---@param y number
---@param width number
---@param height number
---@return Rectangle
function Rectangle.new(x, y, width, height)
	---@class Rectangle
	local rectangle = {}
	rectangle.x = x
	rectangle.y = y
	rectangle.width = width
	rectangle.height = height

	setmetatable(rectangle, Rectangle)
	return rectangle
end

---Creates a new Circle.
---@param x number
---@param y number
---@param radius number
---@return Circle
function Circle.new(x, y, radius)
	---@class Circle
	local circle = {}
	circle.x = x
	circle.y = y
	circle.radius = radius

	setmetatable(circle, Circle)
	return circle
end

---Checks if the Rectangle is colliding with other object.
---@param object Rectangle | Circle
---@return boolean
function Rectangle:isColliding(object)
	local class = getmetatable(object)
	assert(class == Rectangle or class == Circle, "Param must be a Rectangle or Circle.")

	if class == Rectangle then
		return self.x <= object.x + object.width and
			self.y <= object.y + object.height and
			self.x + self.width >= object.x and
			self.y + self.height >= object.y
	elseif class == Circle then
		local dx = object.x - math.max(self.x, math.min(object.x, self.x + self.width))
		local dy = object.y - math.max(self.y, math.min(object.y, self.y + self.height))
		return math.sqrt(dx ^ 2 + dy ^ 2) <= object.radius
	end
	return false
end

---Checks if the Circle is colliding with other object.
---@param object Rectangle | Circle
---@return boolean
function Circle:isColliding(object)
	local class = getmetatable(object)
	assert(class == Rectangle or class == Circle, "Param must be a Rectangle or Circle.")

	if class == Rectangle then
		local dx = self.x - math.max(object.x, math.min(self.x, object.x + object.width))
		local dy = self.y - math.max(object.y, math.min(self.y, object.y + object.height))
		return math.sqrt(dx ^ 2 + dy ^ 2) <= self.radius
	elseif class == Circle then
		return ((object.x - self.x) ^ 2 + (object.y - self.y) ^ 2) ^ 0.5 <= self.radius + object.radius
	end
	return false
end
