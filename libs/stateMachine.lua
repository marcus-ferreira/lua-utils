--[[
	Author: Marcus Ferreira
	Version: 0.2.0
	Date: 18/10/2024
]]

---@class StateMachine
StateMachine = {}
StateMachine.__index = StateMachine

---Creates a new State Machine
---@return StateMachine
function StateMachine.new()
	---@class StateMachine
	local self = setmetatable({}, StateMachine)
	self.states = {}
	self.current = nil
	return self
end

---Adds a state to the State Machine
---@param name string
---@param state function
function StateMachine:addState(name, state)
	self.states[name] = state
end

---Changes the state to another
---@param name string # The name of the state
---@param ... any # The enter parameters of the state
function StateMachine:changeState(name, ...)
	if self.states[name] then
		if self.current and self.current.exit then
			self.current:exit()
		end
		self.current = self.states[name]
		if self.current.enter then
			self.current:enter(...)
		end
	end
end

---Updates the state
---@param dt number # Delta time
function StateMachine:update(dt)
	if self.current and self.current.update then
		self.current:update(dt)
	end
end

---Draws the state
function StateMachine:draw()
	if self.current and self.current.draw then
		self.current.draw()
	end
end
