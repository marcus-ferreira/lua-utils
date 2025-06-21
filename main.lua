Timer = require "libs.timer"

function love.load()
    timers = {
        timer1 = Timer.newTimer(function()
            print("Acabou o timer")
        end)
    }
end

function love.update(dt)
    for _, timer in pairs(timers) do
        timer:update(dt)
    end
end

function love.draw()
end

function love.keypressed(key)
    if key == "space" then
        timers.timer1:start(2)
        print("apertou espaco")
    end
end
