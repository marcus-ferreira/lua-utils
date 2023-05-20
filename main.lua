require("libs.shader")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setMode(1200, 1000, {})

	shaders = {}
	for i, shader in ipairs(Shader) do
		shaders[i] = love.graphics.newShader(shader)
		print(shaders[i])
	end
	currentShader = 1
	isTurnedOn = false

	background = {}
	-- background.img = love.graphics.newImage("resources/world.png")
	background.img = love.graphics.newImage("resources/kanto.png")
	background.x = 0
	background.y = 0
end

function love.update(dt)
	if currentShader == 1 then
		shaders[currentShader]:send("targetX", love.mouse.getX())
		shaders[currentShader]:send("targetY", love.mouse.getY())
		shaders[currentShader]:send("radius", 200)
	end

	if love.keyboard.isDown("w") then background.y = background.y + 5 end
	if love.keyboard.isDown("s") then background.y = background.y - 5 end
	if love.keyboard.isDown("a") then background.x = background.x + 5 end
	if love.keyboard.isDown("d") then background.x = background.x - 5 end
end

function love.draw()
	love.graphics.scale(2, 2)

	if isTurnedOn then love.graphics.setShader(shaders[currentShader]) end

	love.graphics.draw(background.img, background.x, background.y)

	love.graphics.setShader()
end

function love.keypressed(key)
	if key == "space" then
		isTurnedOn = not isTurnedOn
	elseif type(tonumber(key:sub(-1))) == "number" then
		isTurnedOn = true
		currentShader = tonumber(key:sub(-1))
	end
end
