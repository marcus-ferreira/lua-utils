return {
    fonts  = {
        ["main"] = {
            path = "assets/fonts/love.ttf",
            size = 8
        }
    },
    images = {
        ["main"] = {
            path = "",
            grids = {
                { tileWidth = 0, tileHeight = 0, columns = 0, rows = 0, left = 0, top = 0, offsetX = 0, offsetY = 0 },
                { tileWidth = 0, tileHeight = 0, columns = 0, rows = 0, left = 0, top = 0, offsetX = 0, offsetY = 0 }
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
    sounds = {
        ["bgm"] = {
            path = "",
            size = 0
        },
        ["sfx"] = {
            path = "",
            size = 0
        }
    }
}
