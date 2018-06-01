local Block = Object:extend()

function Block:new(x, y, height, width)
    self.x = x
    self.y = y
    self.height = height
    self.width = width
end

function Block:update(dt) 

end

function Block:draw() 
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', self.x, self.y, self.height, self.width)
end

return Block