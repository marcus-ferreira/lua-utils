---Creates new State
---@return State
function newState()
	---@class State
	local state = {}
	function state:enter(params) end
	function state:update(dt) end
	function state:draw() end
	return state
end
