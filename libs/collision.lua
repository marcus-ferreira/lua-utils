--[[
	Version: 0.1.0
]]

---@class collision
collision = {}

---Check if two rectangles is colliding.
---@param ax1 number # The X1 position of the first rectangle.
---@param ay1 number # The Y1 position of the first rectangle.
---@param ax2 number # The X2 position of the first rectangle.
---@param ay2 number # The Y2 position of the first rectangle.
---@param bx1 number # The X1 position of the second rectangle.
---@param by1 number # The Y1 position of the second rectangle.
---@param bx2 number # The X2 position of the second rectangle.
---@param by2 number # The Y2 position of the second rectangle.
---@return boolean
function collision.isRectangleColliding(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)
	return ax1 < bx2 and ay1 < by2 and ax2 > bx1 and ay2 < by1
end

---Check if two circles is colliding.
---@param ax number # The X position of the first circle.
---@param ay number # The Y position of the first circle.
---@param ar number # The radius position of the first circle.
---@param bx number # The X position of the second circle.
---@param by number # The Y position of the second circle.
---@param br number # The radius position of the second circle.
---@return boolean
function collision.isCircleColliding(ax, ay, ar, bx, by, br)
	return ((bx - ax) ^ 2 + (by - ay) ^ 2) ^ 0.5 < ar + br
end
