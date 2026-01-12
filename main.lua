require("dependencies")

function love.load()
    img = love.graphics.newImage("resources/sokoban_tilesheet.png")
    grid = love.graphics.newGrid(img, 13, 8)
    anim = Animation.newAnimation(img, grid, { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, 0, 0, 0.5)
end

function love.update(dt)
    anim:update(dt)
end

function love.draw()
    anim:draw(100, 100)
end

---@param key love.KeyConstant
function love.keypressed(key)
    if key == "escape" then love.event.quit() end
end
