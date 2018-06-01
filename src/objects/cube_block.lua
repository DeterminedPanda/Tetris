local Cube = Object:extend()

function Cube:new(x, y, width, height) 
    top_left = Block(x, y, width, height)
    top_right = Block(x + block_size, y, width, height)
    bottom_left = Block(x, y + block_size, width, height)
    bottom_right = Block(x + block_size, y + block_size, width, height)
end

function Cube:up() 
    -- its a fucking cube, there is no point in rotating it
end

function Cube:left()
    top_left.x = top_left.x - block_size
    top_right.x = top_right.x - block_size
    bottom_left.x = bottom_left.x - block_size
    bottom_right.x = bottom_right.x - block_size
end

function Cube:down() 
    local bottom_left_i = (bottom_left.y / block_size) + 1 -- calculating the vertical position of the bottom_left block in the field table
    local bottom_left_j = (bottom_left.x / block_size) + 1 -- calculating the horizontal position of the bottom_left block in the field table
    local bottom_right_i = (bottom_right.y / block_size) + 1 -- calculating the vertical position of the bottom_right block in the field table
    local bottom_right_j = (bottom_right.x / block_size) + 1 -- calculating the horizontal position of the bottom_right block in the field table
    
    if(field[bottom_left_i][bottom_left_j]:is(EmptyBlock) and field[bottom_right_i][bottom_right_j]:is(EmptyBlock)) then -- if true then no collision was detected
        top_left.y = top_left.y + block_size
        top_right.y = top_right.y + block_size
        bottom_left.y = bottom_left.y + block_size
        bottom_right.y = bottom_right.y + block_size
    else
        print('collision detected')
    end
end

function Cube:right()
    top_left.x = top_left.x + block_size
    top_right.x = top_right.x + block_size
    bottom_left.x = bottom_left.x + block_size
    bottom_right.x = bottom_right.x + block_size
end 

function Cube:update(dt) 

end

function Cube:draw()
    love.graphics.setColor(0, 0, 0)
    top_left:draw()
    top_right:draw()
    bottom_left:draw()
    bottom_right:draw()
end

return Cube