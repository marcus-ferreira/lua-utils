# Love2D Template

## Description
This repository is a Love2D starter template for 2D games in Lua. It provides a minimal game loop, tilemap support, entity and animation helpers, camera control, and a clean project structure for organizing assets, scenes, and libraries.

## How to Use
1. **Clone or use as a template**: Clone this repository or use it as a template on GitHub.
2. **Update project settings**: Edit `conf.lua` to set your game title, window size, and version.
3. **Install Love2D**: Install Love2D on your system from [love2d.org](https://love2d.org/).
4. **Run the game**: Open a terminal in the project folder and run `love .`.
5. **Develop**: Add assets in `assets/`, scenes under `src/scenes/`, and game logic in `src/libs/` and `src/entities/`.

## Project Structure
```
love-template/
├── conf.lua              # Love2D configuration (title, version, etc.)
├── dependencies.lua      # Loads libraries and helper modules
├── main.lua              # Main game entry point and Love callbacks
├── README.md             # Project documentation
├── assets/               # Game assets
│   ├── fonts/            # Font files
│   ├── images/           # Image files and sprite sheets
│   ├── sounds/           # Sound effects and music
│   └── tiled/            # Tiled editor files and tilesets
└── src/
    ├── assets.lua        # Asset manifest
    ├── globals.lua       # Global constants and settings
    ├── entities/         # Game entities (player, objects, etc.)
    ├── libs/             # Utility libraries
    │   ├── love/         # Love2D-specific helper modules
    │   │   ├── animationManager.lua
    │   │   ├── camera.lua
    │   │   ├── color.lua
    │   │   ├── data.lua
    │   │   ├── debug.lua
    │   │   ├── entity.lua
    │   │   ├── imageManager.lua
    │   │   ├── input.lua
    │   │   ├── physics.lua
    │   │   ├── stateManager.lua
    │   │   ├── tilemap.lua
    │   │   ├── timer.lua
    │   │   └── vector.lua
    │   └── lua/          # General Lua utility modules
    │       ├── math.lua
    │       ├── string.lua
    │       ├── table.lua
    │       └── utils.lua
    └── scenes/           # Scene definitions and map logic
        ├── map.lua
        └── place-the-scenes-here.txt
```

## Included Features
- `main.lua` with Love2D lifecycle callbacks and camera handling.
- Tilemap loading with `src/libs/love/tilemap.lua` using Tiled-exported `.lua` maps.
- Entity system with animation and state support.
- Input mapping helpers and physics/collider helpers.
- Utility libraries for vectors, colors, tables, strings, and math.

## Dependencies
- [Love2D](https://love2d.org/) (recommended version: 11.x or higher)

## Contribution
Contributions are welcome. To contribute:
1. Fork the repository.
2. Create a branch for your change (`git checkout -b my-improvement`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin my-improvement`).
5. Open a Pull Request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
