local StraightBlock = Object:extend()

function StraightBlock:new(x, y, width, height)
    first_block = Block(x, y, width, height)
    second_block = Block(x + (block_size * 1), y, width, height)
    third_block = Block(x + (block_size * 2), y, width, height)
    fourth_block = Block(x + (block_size * 3), y, width, height)
end

function StraightBlock:update(dt)

end

function StraightBlock:draw()
    love.graphics.setColor(0, 0.5, 0)
    first_block:draw()
    second_block:draw()
    third_block:draw()
    fourth_block:draw()
end

return StraightBlock