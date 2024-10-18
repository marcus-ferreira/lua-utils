# Lua/LOVE2D Utilitaries

## Description
This project is a collection of Lua libraries and GLSL shaders for game development and graphical applications. It includes utilities for animations, physics, color manipulation, state management, mathematical calculations, and more.


## Project Structure

```
/libs
  |-- animation.lua
  |-- collision.lua
  |-- color.lua
  |-- data.lua
  |-- math.lua
  |-- physics.lua
  |-- state.lua
  |-- table.lua
  |-- vector.lua
/shaders
  |-- 4colors.glsl
  |-- changeColor.glsl
  |-- lightning.glsl
```

## Libraries
* **[animation.lua](libs/animation.lua)**: Manages animations, including the creation and updating of frames.

* **[collision.lua](libs/collision.lua)**: Utility functions for detecting collisions between objects.

* **[color.lua](libs/color.lua)**: Color manipulation, including conversion between different color formats.

* **[data.lua](libs/data.lua)**: Functions for handling data storage and retrieval.

* **[math.lua](libs/math.lua)**: Useful mathematical functions, including vector operations and geometric calculations.

* **[physics.lua](libs/physics.lua)**: Setup and management of physics, including creating bodies and shapes.

* **[state.lua](libs/state.lua)**: State management, including state transitions and updates.

* **[table.lua](libs/table.lua)**: Utility functions for table manipulation, including slicing and serialization.

* **[vector.lua](libs/vector.lua)**: Implementation of 2D vectors, including basic and advanced operations.


## Shaders
* **[4colors.glsl](shaders/4colors.glsl)**: Shader that converts the image to a 4-color palette, simulating a Game Boy style.

* **[changeColor.glsl](shaders/changeColor.glsl)**: Shader that changes the color of objects on the screen based on defined parameters.

* **[lightning.glsl](shaders/lightning.glsl)**: Shader that creates a lighting effect based on the mouse position, with blurred edges and a delay to simulate a shadow.


## Contribution
Feel free to contribute to this project by following these steps:
1. Fork the repository.
2. Create a branch for your feature (```git checkout -b my-feature```).
3. Commit your changes (```git commit -am 'Add new feature'```).
4. Push to the branch (```git push origin my-feature```).
5. Create a new Pull Request.

## License
This project is licensed under the MIT License.
