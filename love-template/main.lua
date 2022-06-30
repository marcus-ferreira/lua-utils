function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")	-- Set pixel filter
	require("src.dependencies")								-- Import all
	math.randomseed(os.time())								-- Generate RNG
	StateMachine:change(TestState)							-- Change to first state
end

function love.update(dt)
	StateMachine.current:update(dt)							-- Update the current state
end

function love.draw()
	love.graphics.scale(WINDOW_SCALE, WINDOW_SCALE)			-- Scale the window to match the virtual dimensions
	StateMachine.current:draw()								-- Draw the current state
end
