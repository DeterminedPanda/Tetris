local DebugBlock = Block:extend()

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

