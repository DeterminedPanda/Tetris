local Block = Object:extend()

function Block:new(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end

function Block:update(dt) 

end

function Block:draw() 
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

return Block