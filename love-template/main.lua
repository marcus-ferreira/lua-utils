function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	require("src.Dependencies")
	math.randomseed(os.time())
	StateMachine:change(TestState)
end

function love.update(dt)
	StateMachine.current:update(dt)
end

function love.draw()
	StateMachine.current:draw()
end
