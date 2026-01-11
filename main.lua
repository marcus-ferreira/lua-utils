require("dependencies")

function love.load()
end

function love.update(dt)
end

function love.draw()
end

---@param key love.KeyConstant
function love.keypressed(key)
    if key == "escape" then love.event.quit() end
end
