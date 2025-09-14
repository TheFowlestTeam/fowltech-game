---Represents the main game state and handles initialization.
---@class Game
local Game = {}

---Initializes the game
---@param width number The width of the game window
---@param height number The height of the game window
function Game:init(width, height)
    love.window.setMode(width, height)
end

return Game