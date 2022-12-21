love.keyboard.keys = {}

function love.keypressed(key)
	love.keyboard.keys[key] = true
end

function love.keyreleased(key)
	love.keyboard.keys[key] = false
end
