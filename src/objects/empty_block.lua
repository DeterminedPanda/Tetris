local Empty = Block:extend()

function Empty:new(x, y)
    Empty.super.new(self, x, y)
end

function Empty:update(dt)

end

function Empty:draw()
    love.graphics.setColor(0.950, 0.950, 0.950)
    Empty.super.draw(self)
end

return Empty
