---Represents a basic game object.
---@class GameObject
---@field x number The X position of the object
---@field y number The Y position of the object
---@field alive boolean Whether the object is alive (true = active, false = dead)
---@field visible boolean Whether the object is visible (true = rendered, false = hidden)
---@field parent GameObject|nil The parent GameObject, if any (used for hierarchy)
---@field children GameObject[] A list of child GameObjects attached to this object
local GameObject = {}
GameObject.__index = GameObject

---Creates a new GameObject instance
---@return GameObject object The newly created GameObject
function GameObject:new()
    local o = setmetatable({}, self)
    o.x = 0
    o.y = 0
    o.alive = true
    o.visible = true
    o.parent = nil
    o.children = {}

    return o
end

---Gets the position of the GameObject
---@return number x The X position of the GameObject
---@return number y The Y position of the GameObject
function GameObject:getPosition()
    local x, y = self.x, self.y
    local parent = self.parent
    while parent do
        x = x + parent.x
        y = y + parent.y
        parent = parent.parent
    end
    return x, y
end

---Gets the on-screen position of the GameObject
---@return number x The X position of the GameObject
---@return number y The Y position of the GameObject
function GameObject:getGlobalPosition()
    local x, y = self.x, self.y
    return x, y
end

---Called when the GameObject is initialized or added to the game
function GameObject:ready()

end

---Adds a child GameObject to this object
---@param child GameObject The child object to add
function GameObject:addChild(child)
    child.parent = self
    table.insert(self.children, child)
    child:ready()
end

---Removes a child GameObject from this object
---@param child GameObject The child object to remove
function GameObject:removeChild(child)
    for i, obj in ipairs(self.children) do
        if obj == child then
            child.parent = nil
            table.remove(self.children, i)
            break
        end
    end
end

---Processes the GameObject logic
---@param delta number The time elapsed since the last frame, in seconds
function GameObject:process(delta)
    
end

---Processes a GameObject's children
---@param delta number The time elapsed since the last frame, in seconds
function GameObject:baseProcess(delta)
    for _, child in ipairs(self.children) do
        if child.alive then
            child:process(delta)
        end
    end
end

---Draws graphics to the screen
function GameObject:draw()
    
end

---Draws graphics to the screen from child commands
function GameObject:baseDraw()
    for _, child in ipairs(self.children) do
        if child.alive then
            child:draw()
        end
    end
end

return GameObject