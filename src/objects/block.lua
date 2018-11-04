local Block = Object:extend()

function Block:new(x, y)
    self.x = x
    self.y = y
end

function Block:update(dt) 

end

function Block:draw() 
    love.graphics.rectangle('fill', self.x, self.y, block_size, block_size)
end

return Block
