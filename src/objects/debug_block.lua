local DebugBlock = Block:extend()

-- This block is used for collision testing
function DebugBlock:new(x, y, width, height)
    DebugBlock.super:new(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end

function DebugBlock:update(dt)

end

function DebugBlock:draw()
    love.graphics.setColor(0.5, 0.5, 0.5)
    DebugBlock.super.draw(self)
end

return DebugBlock
