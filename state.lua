---Creates new State
---@return State
function love.graphics.newState()
	---@class State
	local state = {}

	function state:load(params) end
	function state:update(dt) end
	function state:draw() end

	return state
end
