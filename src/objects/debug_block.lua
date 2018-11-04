local Debug = Block:extend()

-- This block is used for collision testing
function Debug:new(x, y)
    Debug.super.new(self, x, y)
end

function Debug:update(dt)

end

function Debug:draw()
    love.graphics.setColor(0.5, 0.5, 0.5)
    Debug.super.draw(self)
end

return Debug
