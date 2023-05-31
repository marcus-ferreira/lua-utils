--[[
	Version: 0.1.1
]]

---@class State
State = {}
State.__index = State

---Creates new State
---@return State
function State:new()
	---@class State
	local state = {}
	setmetatable(state, State)
	return state
end

---Initialize a state
---@param params table # The table of parameters to be passed
function State:load(params) end

---Updates the state
---@param dt number # Delta time
function State:update(dt) end

---Draws the state
function State:draw() end
