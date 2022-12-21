---Check if two rectangles are colliding
---@param aX number # The x position of the first rectangle
---@param aY number # The y position of the first rectangle
---@param aWidth number # The width of the first rectangle
---@param aHeight number # The height of the first rectangle
---@param bX number # The x position of the second rectangle
---@param bY number # The y position of the second rectangle
---@param bWidth number # The width of the second rectangle
---@param bHeight number # The height of the second rectangle
---@return boolean # True if the rectangles ar colliding, false on contrary
function IsColliding(aX, aY, aWidth, aHeight, bX, bY, bWidth, bHeight)
	local aX2 = aX + aWidth
	local aY2 = aY + aHeight
	local bx2 = bX + bWidth
	local bY2 = bY + bHeight

	return aX < bx2 and aY < aY2 and bX < aX2 and bY < aY2
end

---Check if two rectangles are colliding
---@param a table # The first rectangle with the keys "x", "y", "width" e "height".
---@param b table # The second rectangle with the keys "x", "y", "width" e "height".
---@return boolean # True if the rectangles ar colliding, false on contrary
function IsColliding(a, b)
	a.x2 = a.x + a.width
	a.y2 = a.y + a.height
	b.x2 = b.x + b.width
	b.y2 = b.y + b.height

	return a.x < b.x2 and a.y < b.y2 and b.x < a.x2 and b.y < a.y2
end
