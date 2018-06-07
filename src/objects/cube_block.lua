local Cube = Object:extend()

local top_left = nil
local top_right = nil
local bottom_left = nil 
local bottom_right = nil

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
    local top_left_i = (top_left.y / block_size) + 1 -- calculating the vertical index of the block that is directly to the left of top_left block 
    local top_left_j = (top_left.x / block_size) -- calculating the horizontal index of the block that is directly to the left of top_left block
    local bottom_left_i = (bottom_left.y / block_size) + 1 -- calculating the vertical index of the block that is directly to the left of bottom_left block
    local bottom_left_j = (bottom_left.x / block_size)  -- calculating the horizontal index of the block that is directly to the left of bottom_left block

    -- check if there is a block directly to the left of the cube
    if(field[top_left_i][top_left_j]:is(EmptyBlock) and field[bottom_left_i][bottom_left_j]:is(EmptyBlock)) then
        top_left.x = top_left.x - block_size
        top_right.x = top_right.x - block_size
        bottom_left.x = bottom_left.x - block_size
        bottom_right.x = bottom_right.x - block_size
    else
        print('collision detected')
    end
end

function Cube:down() 
    local bottom_left_i = (bottom_left.y / block_size) + 2 -- calculating the vertical index of the block that is directly under the bottom_left block
    local bottom_left_j = (bottom_left.x / block_size) + 1 -- calculating the horizontal index of the block that is directly under the bottom_left block
    local bottom_right_i = (bottom_right.y / block_size) + 2 -- calculating the vertical index of the block that is directly under the bottom_right block
    local bottom_right_j = (bottom_right.x / block_size) + 1 -- -- calculating the horizontal index of the block that is directly under the bottom_right block

    -- check if there is a block directly under the Cube
    if(field[bottom_left_i][bottom_left_j]:is(EmptyBlock) and field[bottom_right_i][bottom_right_j]:is(EmptyBlock)) then
        top_left.y = top_left.y + block_size
        top_right.y = top_right.y + block_size
        bottom_left.y = bottom_left.y + block_size
        bottom_right.y = bottom_right.y + block_size
    else
        print('collision detected')
    end
end

function Cube:right()
    local top_right_i = (top_right.y / block_size) + 1 -- calculating the vertical index of the block that is directly to the right of top_right block 
    local top_right_j = (top_right.x / block_size) + 2 -- calculating the horizontal index of the block that is directly to the right of top_right block
    local bottom_right_i = (bottom_right.y / block_size) + 1 -- calculating the vertical index of the block that is directly to the right of bottom_right block
    local bottom_right_j = (bottom_right.x / block_size) + 2  -- calculating the horizontal index of the block that is directly to the right of bottom_right block

    -- check if there is a block directly to the right of the cube
    if(field[top_right_i][top_right_j]:is(EmptyBlock) and field[bottom_right_i][bottom_right_j]:is(EmptyBlock)) then
        top_left.x = top_left.x + block_size
        top_right.x = top_right.x + block_size
        bottom_left.x = bottom_left.x + block_size
        bottom_right.x = bottom_right.x + block_size
    else
        print('collision detected')
    end
end 

function Cube:update(dt) 

end

function Cube:draw()
    love.graphics.setColor(0.858, 0.662, 0)
    top_left:draw()
    top_right:draw()
    bottom_left:draw()
    bottom_right:draw()
end

return Cube