local Debug = Block:extend()

-- This block is used for collision testing
function Debug:new(x, y, width, height)
    Debug.super:new(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end

function Debug:update(dt)

end

function Debug:draw()
    love.graphics.setColor(0.5, 0.5, 0.5)
    Debug.super.draw(self)
end

return Debug
