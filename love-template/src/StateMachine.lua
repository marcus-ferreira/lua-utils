StateMachine = {}

---Change to another state
---@param state State # The state to be changed
---@param params? table # The params to be passed on to the state
function StateMachine:change(state, params)
	self.current = state
	self.current:enter(params or {})
end
