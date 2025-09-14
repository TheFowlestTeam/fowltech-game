local GameObject = require("engine.scene.object")

---@type GameObject
local Object = GameObject:new()
function Object:ready()
    print("annoying object")
    self.x, self.y = 10, 10
end

function Object:process(dt)
    GameObject.baseProcess(Object, dt)
    print("annoying object, dt is " .. dt)
end

function Object:draw()
    GameObject.baseDraw(self)
    local x, y = self:getPosition()
    love.graphics.print("Hello, I'm Object.", x, y)
end

local Object2 = require("source.object2")
Object:addChild(Object2)

return Object