local EmptyBlock = Block:extend()

function EmptyBlock:new(x, y, width, height)
    EmptyBlock.super.new(self, x, y, width, height)
end

function EmptyBlock:update(dt)

end

function EmptyBlock:draw()
    love.graphics.setColor(1, 1, 1)
    EmptyBlock.super.draw(self)
end

return EmptyBlock
