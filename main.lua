function love.load()
    -- Initializes the game settings
    love.graphics.setDefaultFilter("nearest", "nearest")
    require("dependencies")
    ResizeWindow(-1)

    local manifest = require("src.assets")
    assets = { fonts = {}, images = {}, sounds = {} }

    for name, params in pairs(manifest.fonts) do
        assets.fonts[name] = love.graphics.newFont(params.path, params.size)
    end

    for name, params in pairs(manifest.images) do
        assets.images[name] = imageManager.newImageManager(params.path, params.grids)
    end

    for name, path in pairs(manifest.sounds) do
        -- "static" for short sounds, "stream" for long music files
        local type = name:sub(1, 3) == "bgm" and "stream" or "static"
        assets.sounds[name] = love.audio.newSource(path, type)
    end

    love.graphics.setBackgroundColor(colors.sweetie16.BLACK)
    love.graphics.setFont(assets.fonts["main"])

    input.setActionsKeys({
        ["up"]     = {
            keys    = { "up", "w" },
            buttons = { "dpup" },
            axes    = { "lefty-" }
        },
        ["down"]   = {
            keys    = { "down", "s" },
            buttons = { "dpdown" },
            axes    = { "lefty+" }
        },
        ["left"]   = {
            keys    = { "left", "a" },
            buttons = { "dpleft" },
            axes    = { "leftx-" }
        },
        ["right"]  = {
            keys    = { "right", "d" },
            buttons = { "dpright" },
            axes    = { "leftx+" }
        },
        ["attack"] = {
            keys    = { "space" },
            buttons = { "x" }
        },
        ["jump"]   = {
            keys    = { "up", "w" },
            buttons = { "a" }
        },
        ["quit"]   = {
            keys    = { "escape" },
            buttons = { "back" }
        }
    })

    world = physics.newWorld(0, 900, true, {
        ---@param a love.Fixture
        ---@param b love.Fixture
        ---@param coll love.Contact
        beginContact = function(a, b, coll)
            local userDatas = { a:getUserData(), b:getUserData() }
            if table.containsAll(userDatas, { "footSensor", "ground" }) then
                player:getCollider():addContact("ground")
            elseif table.containsAny(userDatas, { "leftSensor", "rightSensor" }) and table.contains(userDatas, "wall") then
                player:getCollider():addContact("wall")
            end
        end,
        ---@param a love.Fixture
        ---@param b love.Fixture
        ---@param coll love.Contact
        endContact = function(a, b, coll)
            local userDatas = { a:getUserData(), b:getUserData() }
            if table.containsAll(userDatas, { "footSensor", "ground" }) then
                player:getCollider():removeContact("ground")
            elseif table.containsAny(userDatas, { "leftSensor", "rightSensor" }) and table.contains(userDatas, "wall") then
                player:getCollider():removeContact("wall")
            end
        end
    })

    player = entity.newPlatformerEntity(world, 100, 100, 150, 300, {
        fixtures = {
            ["main"]        = { "polygon", false, 0, 0, 24, 16 },
            ["footSensor"]  = { "polygon", true, 0, 8, 18, 4 },
            ["leftSensor"]  = { "polygon", true, -12, 0, 4, 10 },
            ["rightSensor"] = { "polygon", true, 12, 0, 4, 10 }
        },
        animations = {
            ["idle"]      = { assets.images.player:getImage(), assets.images.player:getGrid(1), { 1 }, 16, 24 },
            ["ducking"]   = { assets.images.player:getImage(), assets.images.player:getGrid(1), { 3 }, 16, 24 },
            ["walking"]   = { assets.images.player:getImage(), assets.images.player:getGrid(1), { 8, 9, 10, 11, 12, 13 }, 16, 24, 0.07, true },
            ["jumping"]   = { assets.images.player:getImage(), assets.images.player:getGrid(1), { 14 }, 16, 24 },
            ["running"]   = { assets.images.player:getImage(), assets.images.player:getGrid(1), { 4, 5, 6, 7 }, 16, 24, 0.05, true },
            ["falling"]   = { assets.images.player:getImage(), assets.images.player:getGrid(1), { 15 }, 16, 24 },
            ["attacking"] = { assets.images.player:getImage(), assets.images.player:getGrid(2), { 1, 2, 3, 4, 5 }, 16, 32, 0.07 },
        },
        states = {
            ["idle"] = {
                enter = function()
                    player:getAnimationManager():changeAnimation("idle")
                end,
                update = function()
                    player:move(0)
                    if input.isActionDown("left") or input.isActionDown("right") then
                        player:getStateManager():changeState("walking")
                    end
                    if input.isActionDown("down") then
                        player:getStateManager():changeState("ducking")
                    end
                    if input.isActionPressed("attack") then
                        player:getStateManager():changeState("attacking")
                    end
                    if input.isActionPressed("jump") and player:isOnGround() then
                        player:getStateManager():changeState("jumping")
                    end
                end
            },
            ["ducking"] = {
                enter = function()
                    player:getAnimationManager():changeAnimation("ducking")
                end,
                update = function()
                    player:move(0)
                    if not input.isActionDown("down") then
                        player:getStateManager():changeState("idle")
                    end
                    if input.isActionPressed("attack") then
                        player:getStateManager():changeState("attacking")
                    end
                end
            },
            ["walking"] = {
                enter = function()
                    player:getAnimationManager():changeAnimation("walking")
                end,
                update = function()
                    local move = input.getAxis("left", "right", "leftx")
                    player:move(move)
                    player:getAnimationManager():getCurrentAnimation():setInterval(0.15 - math.abs(move) * 0.08)
                    if math.abs(move) > 0.7 then
                        player:getStateManager():changeState("running")
                    end
                    if not player:isMoving() then
                        player:getStateManager():changeState("idle")
                    end
                    if input.isActionDown("down") then
                        player:getStateManager():changeState("ducking")
                    end
                    if input.isActionPressed("jump") then
                        player:getStateManager():changeState("jumping")
                    end
                    if input.isActionPressed("attack") then
                        player:getStateManager():changeState("attacking")
                    end
                end
            },
            ["running"] = {
                enter = function()
                    player:getAnimationManager():changeAnimation("running")
                end,
                update = function()
                    local move = input.getAxis("left", "right", "leftx")
                    player:move(move)
                    player:getAnimationManager():getCurrentAnimation():setInterval(0.15 - math.abs(move) * 0.08)
                    if math.abs(move) < 0.7 then
                        player:getStateManager():changeState("walking")
                    end
                    if not player:isMoving() then
                        player:getStateManager():changeState("idle")
                    end
                    if input.isActionDown("down") then
                        player:getStateManager():changeState("ducking")
                    end
                    if input.isActionPressed("jump") then
                        player:getStateManager():changeState("jumping")
                    end
                    if input.isActionPressed("attack") then
                        player:getStateManager():changeState("attacking")
                    end
                end
            },
            ["jumping"] = {
                enter = function()
                    player:getAnimationManager():changeAnimation("jumping")
                    player:jump()
                    if player:isOnGround() then
                    end
                end,
                update = function()
                    player:move(input.getAxis("left", "right", "leftx"))
                    if input.isActionPressed("attack") then
                        player:getStateManager():changeState("attacking")
                    end
                    if input.isActionPressed("jump") then
                        player:getStateManager():changeState("jumping")
                    end
                    if player:isFalling() then
                        player:getStateManager():changeState("falling")
                    end
                end
            },
            ["falling"] = {
                enter = function()
                    player:getAnimationManager():changeAnimation("falling")
                end,
                update = function()
                    player:move(input.getAxis("left", "right", "leftx"))
                    if input.isActionPressed("attack") then
                        player:getStateManager():changeState("attacking")
                    end
                    if input.isActionPressed("jump") then
                        player:getStateManager():changeState("jumping")
                    end
                    if player:isOnGround() then
                        player:getStateManager():changeState("idle")
                    end
                end
            },
            ["attacking"] = {
                enter = function()
                    player:getAnimationManager():changeAnimation("attacking")
                end,
                update = function()
                    if player:isOnGround() then
                        player:move(0)
                    end
                    if player:getAnimationManager():getCurrentAnimation():isFinished() then
                        if player:isOnGround() then
                            player:getStateManager():changeState("idle")
                        elseif player:isFalling() then
                            player:getStateManager():changeState("falling")
                        else
                            player:getStateManager():changeState("jumping")
                        end
                    end
                end
            }
        }
    })

    player:getStateManager():changeState("idle")

    map = tilemap.newTilemap("src.scenes.map", assets.images.tileset)

    local mapWidth, mapHeight = map:getMapSizeInPixels():getCoordinates()
    blocks = {
        entity.newStaticEntity(world, "wall", -7.5, VIRTUAL_HEIGHT / 2, 15, VIRTUAL_HEIGHT),
        entity.newStaticEntity(world, "ground", mapWidth / 2, mapHeight - 47.5, mapWidth, 95)
    }
end

---@param dt number
function love.update(dt)
    -- Closes the game
    if input.isActionPressed("quit") then
        love.event.quit()
    end

    world:update(dt)
    player:update(dt)

    local playerX, playerY = player:getCollider():getBody():getPosition()
    local mapWidth, mapHeight = map:getMapSizeInPixels():getCoordinates()
    local playerDirection = player:getAnimationManager():getScaleX()
    local offset = playerDirection * 60
    local viewportWidth = love.graphics.getWidth() / camera.scale
    local viewportHeight = love.graphics.getHeight() / camera.scale
    camera.follow(playerX + offset, playerY, viewportWidth, viewportHeight, mapWidth, mapHeight, dt)

    input.resetPressedKeys()
end

function love.draw()
    camera.set()
    map:draw()
    player:draw()
    -- world:drawColliders()
    camera.unset()

    love.graphics.print("playerState: " .. player:getStateManager():getCurrentState():getName())
    love.graphics.print(
    "Frame atual: " .. tostring(player:getAnimationManager():getCurrentAnimation():getCurrentFrame()), 0, 10)
end
