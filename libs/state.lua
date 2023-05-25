--[[
	Version: 0.1.0
]]

---@class State
State = {}

---Creates new State
---@return State
function State:new()
	---@class State
	local state = {}
	setmetatable(state, { __index = self })
	return state
end

---Initialize a state
---@param params table # The table of parameters to be passed
function State:load(params)
	self:load(params)
end

---Updates the state
---@param dt number # Delta time
function State:update(dt)
	self:update(dt)
end

---Draws the state
function State:draw()
	self:draw()
end
