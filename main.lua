function love.load()
    -- Initializes the game settings
    love.graphics.setDefaultFilter("nearest", "nearest")
    require("dependencies")

    LoadAssets()
    love.graphics.setBackgroundColor(colors.sweetie16.BLACK)
    love.graphics.setFont(assets.fonts["main"])

    camera.setScale(math.floor(love.graphics.getWidth() / VIRTUAL_WIDTH))
    input.setActionsKeys(assets.inputs)
end

---@param dt number
function love.update(dt)
    -- Closes the game
    if input.isActionPressed("quit") then
        love.event.quit()
    end

    --- Update everything

    input.resetPressedKeys()
end

function love.draw()
    camera.set()
    --- Draw everything
    camera.unset()
end
