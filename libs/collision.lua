--[[
	Collision library

	Author: Marcus Ferreira
	Version: 1.0
]] --

---Check if two rectangles are colliding.
---@param a table # The first rectangle with the keys "x", "y", "width" and "height".
---@param b table # The second rectangle with the keys "x", "y", "width" and "height".
---@return boolean # True if the rectangles are colliding, false on contrary.
function IsColliding(a, b)
	a.x2 = a.x + a.width
	a.y2 = a.y + a.height
	b.x2 = b.x + b.width
	b.y2 = b.y + b.height
	return a.x < b.x2 and a.x2 > b.x and a.y < b.y2 and a.y2 > b.y
end

---Return the position of the collision of the object A to B.
---@param a table # The A object.
---@param b table # The B object.
---@return string # The vector table of the collision. -1 means the object A is at a negative position relative to object B (from left or top). 0 means the object A is not colliding with object B. 1 means the object A is at a positive position relative to object B (from right or bottom).
function GetCollisionPosition(a, b)
	local distanceALeftToBRight = math.abs(a.x - b.x2)
	local distanceARightToBLeft = math.abs(a.x2 - b.x)
	local distanceATopToBBottom = math.abs(a.y - b.y2)
	local distanceABottomToBTop = math.abs(a.y2 - b.y)
	local minorDistance = math.min(
		distanceALeftToBRight,
		distanceARightToBLeft,
		distanceATopToBBottom,
		distanceABottomToBTop)

	-- A top right to B bottom left
	if minorDistance == distanceALeftToBRight and
		minorDistance == distanceABottomToBTop then
		return "top to bottom"
	end

	-- A bottom right to B top left
	if minorDistance == distanceALeftToBRight and
		minorDistance == distanceATopToBBottom then
		return "bottom to top"
	end

	-- A top left to B bottom right
	if minorDistance == distanceARightToBLeft and
		minorDistance == distanceABottomToBTop then
		return "bottom to top"
	end

	-- A bottom left to B top right
	if minorDistance == distanceARightToBLeft and
		minorDistance == distanceATopToBBottom then
		return "left to right"
	end

	if minorDistance == distanceALeftToBRight then
		return "right to left"
	elseif minorDistance == distanceARightToBLeft then
		return "left to right"
	elseif minorDistance == distanceATopToBBottom then
		return "bottom to top"
	elseif minorDistance == distanceABottomToBTop then
		return "top to bottom"
	end

	return "none"
end

function IsPlaceFree(obj, x, y) end
