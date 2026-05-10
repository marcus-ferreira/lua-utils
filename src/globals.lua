VIRTUAL_WIDTH  = 400 -- Internal game width size
VIRTUAL_HEIGHT = 300 -- Internal game height size


---@enum Colors
colors = {
    _DEFAULT  = { 1, 1, 1 },
    _BLACK    = { 0, 0, 0 },
    sweetie16 = {
        BLACK       = { 0.10, 0.11, 0.17 }, -- #1a1c2c
        PURPLE_DARK = { 0.36, 0.15, 0.36 }, -- #5d275d
        RED         = { 0.69, 0.24, 0.33 }, -- #b13e53
        ORANGE      = { 0.94, 0.49, 0.34 }, -- #ef7d57
        YELLOW      = { 1.00, 0.80, 0.46 }, -- #ffcd75
        LIME        = { 0.65, 0.94, 0.44 }, -- #a7f070
        GREEN       = { 0.22, 0.72, 0.39 }, -- #38b764
        TEAL_DARK   = { 0.15, 0.44, 0.47 }, -- #257179
        BLUE_DARK   = { 0.16, 0.21, 0.44 }, -- #29366f
        BLUE        = { 0.23, 0.36, 0.79 }, -- #3b5dc9
        BLUE_LIGHT  = { 0.25, 0.65, 0.96 }, -- #41a6f6
        CYAN        = { 0.45, 0.94, 0.97 }, -- #73eff7
        WHITE       = { 0.96, 0.96, 0.96 }, -- #f4f4f4
        GREY_BLUE   = { 0.58, 0.69, 0.76 }, -- #94b0c2
        GREY        = { 0.34, 0.42, 0.53 }, -- #566c86
        GREY_DARK   = { 0.20, 0.24, 0.34 }, -- #333c57
    }
}


--- Functions
---Resizes the window given a scale factor.
---@param scale number The scale factor (-1 for fullscreen).
function ResizeWindow(scale)
    if scale == -1 then
        love.window.setMode(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { fullscreen = true, fullscreentype = "desktop" })
    else
        love.window.setMode(VIRTUAL_WIDTH * scale, VIRTUAL_HEIGHT * scale)
    end
    scale = math.floor(love.graphics.getWidth() / VIRTUAL_WIDTH)
    camera.setScale(scale)
end
