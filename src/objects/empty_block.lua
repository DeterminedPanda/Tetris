local Empty = Block:extend()

function Empty:new(x, y, width, height)
    Empty.super.new(self, x, y, width, height)
end

function Empty:update(dt)

end

function Empty:draw()
    love.graphics.setColor(1, 1, 1)
    Empty.super.draw(self)
end

return Empty
