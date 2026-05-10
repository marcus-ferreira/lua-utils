return {
    fonts  = {
        ["main"] = { path = "assets/fonts/love.ttf", size = 8 }
    },
    images = {
        ["player"] = {
            path = "assets/images/ivysaur.png",
            grids = {
                { tileWidth = 32, tileHeight = 32, columns = 10, rows = 2 },
                { tileWidth = 74, tileHeight = 40, columns = 5,  rows = 1, top = 64 }
            }
        },
        ["tileset"] = {
            path = "assets/images/tileset.png",
            grids = {
                { tileWidth = 16, tileHeight = 16, columns = 17, rows = 10 }
            }
        }
    },
    inputs = {
        ["uiUp"]     = {
            keys    = { "up", "w" },
            buttons = { "dpup" },
            axes    = { "lefty-" }
        },
        ["uiDown"]   = {
            keys    = { "down", "s" },
            buttons = { "dpdown" },
            axes    = { "lefty+" }
        },
        ["uiLeft"]   = {
            keys    = { "left", "a" },
            buttons = { "dpleft" },
            axes    = { "leftx-" }
        },
        ["uiRight"]  = {
            keys    = { "right", "d" },
            buttons = { "dpright" },
            axes    = { "leftx+" }
        },
        ["uiAccept"] = {
            keys    = { "return", "space" },
            buttons = { "a" }
        },
        ["uiCancel"] = {
            keys    = { "escape" },
            buttons = { "b" }
        }
    },
    sounds = {}
}
