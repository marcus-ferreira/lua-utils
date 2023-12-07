require("dependencies")

function love.load()
	image = love.graphics.newImage("test.png")
	grid = animation.newGrid(16, 16, 2, 2)
	animation = animation.newAnimation(image, grid, { 1, 2, 3, 4 }, 1, true)
end

function love.update(dt)
	animation:update(dt)
end

function love.draw()
	animation:draw(0, 0)
end

function love.keypressed(key)
	if key == "escape" then love.event.quit() end
end
