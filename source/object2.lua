local GameObject = require("engine.scene.object")

---@type GameObject
local Object2 = GameObject:new()
function Object2:ready()
    print("annoying object 2")
    self.x, self.y = 20, 20
end

function Object2:process(dt)
    GameObject.baseProcess(Object2, dt)
    print("annoying object 2, dt is " .. dt)
end

function Object2:draw()
    local x, y = self:getPosition()
    love.graphics.print("Hello, I'm Object2.", x, y)
end

return Object2