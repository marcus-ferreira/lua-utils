--[[
	Version 0.1.1
]]

---@class Vector
Vector = {}
Vector.__index = Vector

---@class Vector2 : Vector
Vector2 = {}
Vector2.__index = Vector2
Vector2.__add = function(vectorA, vectorB) return Vector2.new(vectorA.x + vectorB.x, vectorA.y + vectorB.y) end
Vector2.__sub = function(vectorA, vectorB) return Vector2.new(vectorA.x - vectorB.x, vectorA.y - vectorB.y) end
Vector2.__mul = function(vector, scalar)
	assert(type(scalar) == "number", "Scalar must be a number")
	return Vector2.new(vector.x * scalar, vector.y * scalar)
end
Vector2.__div = function(vector, scalar)
	assert(type(scalar) == "number", "Scalar must be a number")
	return Vector2.new(vector.x / scalar, vector.y / scalar)
end
setmetatable(Vector2, Vector)

---Creates a new Vector2.
---@param x number
---@param y number
---@return Vector2
function Vector2.new(x, y)
	---@class Vector2 : Vector
	local vector2 = {}
	vector2.x = x
	vector2.y = y
	setmetatable(vector2, Vector2)
	return vector2
end

function Vector2:normalized()
	local lvl = (self.x ^ 2 + self.y ^ 2) ^ 0.5
	if lvl ~= 0 then return Vector2.new(self.x / lvl, self.y / lvl) end
	return Vector2.new(0, 0)
end
