local Game = require("engine.game")

Game:init(640, 480)

local Object = require("source.object")

function love.load()
    Object:ready()
end

function love.draw()
    Object:draw()
end

function love.update(dt)
    Object:process(dt)
end