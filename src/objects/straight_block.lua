local StraightBlock = Object:extend()

-- this block is initially lying down and aligned like this (from left to right): first_block second_block third_block fourth_block
local first_block = nil
local second_block = nil
local third_block = nil
local fourth_block = nil
local state = 1

-- the passed parameters will be assigned to the first_block.
-- the values for second_block, third_block and fourth_block will be calculated from the passed parameters
function StraightBlock:new(x, y, width, height)
    first_block = Block(x, y, width, height)
    second_block = Block(x + (block_size * 1), y, width, height)
    third_block = Block(x + (block_size * 2), y, width, height)
    fourth_block = Block(x + (block_size * 3), y, width, height)
end

function StraightBlock:up()
    if(state == 1) then -- the block will change its position from a lying to a standing position
        self:state_one()
        state = 2
    elseif(state == 2) then -- the block will change its position from a standing to a lying position
        self:state_two()
        state = 1
    end
end

-- changes the block from a lying position to a standing position
function StraightBlock:state_one()
    local j = (third_block.x / block_size) + 1 
    local first_block_i = (third_block.y / block_size) - 1 -- calculates the new vertical index position in the field table
    local second_block_i = (third_block.y / block_size) -- calculates the new vertical index position in the field table
    local fourth_block_i = (third_block.y / block_size) + 2 -- calculates the new vertical index position in the field table

    if(field[first_block_i][j]:is(EmptyBlock) and field[second_block_i][j]:is(EmptyBlock) and field[fourth_block_i][j]:is(EmptyBlock)) then
            first_block.y = (first_block_i - 1) * block_size
            second_block.y = (second_block_i - 1) * block_size
            fourth_block.y = (fourth_block_i - 1) * block_size
            first_block.x, second_block.x, fourth_block.x = third_block.x, third_block.x, third_block.x
    else
        print('collision detected')
    end
end

-- changes the block from a standing position to a lying position
function StraightBlock:state_two() 
    local i = (third_block.y / block_size) + 1 -- calculates the horizontal index position in the field table
    local first_block_j = (third_block.x / block_size) - 1 -- calculates the vertical index position in the field table
    local second_block_j = (third_block.x / block_size) -- calculates the vertical index position in the field table
    local fourth_block_j = (third_block.x / block_size) + 2 -- calculates the vertical index position in the field table

    if(field[i][first_block_j]:is(EmptyBlock) and field[i][second_block_j]:is(EmptyBlock) and field[i][fourth_block_j]:is(EmptyBlock)) then
        first_block.x = (first_block_j - 1) * block_size
        second_block.x = (second_block_j - 1) * block_size
        fourth_block.x = (fourth_block_j - 1) * block_size
        first_block.y, second_block.y, fourth_block.y = third_block.y, third_block.y, third_block.y
    else
        print('collsion detected')
    end
end

function StraightBlock:left()
    local first_block_i = (first_block.y / block_size) + 1 -- calculates the vertical index position in the field table
    local first_block_j = (first_block.x / block_size) -- calculates the horizontal index position in the field table
    local second_block_i = (second_block.y / block_size) + 1 -- calculates the vertical index position in the field table
    local second_block_j = (second_block.x / block_size) -- calculates the horizontal index position in the field table
    local third_block_i = (third_block.y / block_size) + 1 -- calculates the vertical index position in the field table
    local third_block_j = (third_block.x / block_size) -- calculates the horizontal index position in the field table
    local fourth_block_i = (fourth_block.y / block_size) + 1 -- calculates the vertical index position in the field table
    local fourth_block_j = (fourth_block.x / block_size) -- calculates the horizontal index position in the field table

    if(field[first_block_i][first_block_j]:is(EmptyBlock) and field[second_block_i][second_block_j]:is(EmptyBlock) and field[third_block_i][third_block_j]:is(EmptyBlock) and field[fourth_block_i][fourth_block_j]:is(EmptyBlock)) then
        first_block.x = first_block.x - block_size
        second_block.x = second_block.x - block_size
        third_block.x = third_block.x - block_size
        fourth_block.x = fourth_block.x - block_size
    else 
        print('collision detected')
    end
end

function StraightBlock:down()
    local first_block_i = (first_block.y / block_size) + 2 -- calculates the vertical index position in the field table
    local first_block_j = (first_block.x / block_size) + 1 -- calculates the horizontal index position in the field table
    local second_block_i = (second_block.y / block_size) + 2 -- calculates the vertical index position in the field table
    local second_block_j = (second_block.x / block_size) + 1 -- calculates the horizontal index position in the field table
    local third_block_i = (third_block.y / block_size) + 2 -- calculates the vertical index position in the field table
    local third_block_j = (third_block.x / block_size) + 1 -- calculates the horizontal index position in the field table
    local fourth_block_i = (fourth_block.y / block_size) + 2 -- calculates the vertical index position in the field table
    local fourth_block_j = (fourth_block.x / block_size) + 1 -- calculates the horizontal index position in the field table

    -- check if there is a block directly under the block
    if(field[first_block_i][first_block_j]:is(EmptyBlock) and field[second_block_i][second_block_j]:is(EmptyBlock) and 
    field[third_block_i][third_block_j]:is(EmptyBlock) and field[fourth_block_i][fourth_block_j]:is(EmptyBlock)) then 
        first_block.y = first_block.y + block_size
        second_block.y = second_block.y + block_size
        third_block.y = third_block.y + block_size
        fourth_block.y = fourth_block.y + block_size
    else 
        print("collision detected")
    end
end

function StraightBlock:right()
    local first_block_i = (first_block.y / block_size) + 1 -- calculates the vertical index position in the field table
    local first_block_j = (first_block.x / block_size) + 2 -- calculates the horizontal index position in the field table
    local second_block_i = (second_block.y / block_size) + 1 -- calculates the vertical index position in the field table
    local second_block_j = (second_block.x / block_size) + 2 -- calculates the horizontal index position in the field table
    local third_block_i = (third_block.y / block_size) + 1 -- calculates the vertical index position in the field table
    local third_block_j = (third_block.x / block_size) + 2 -- calculates the horizontal index position in the field table
    local fourth_block_i = (fourth_block.y / block_size) + 1 -- calculates the vertical index position in the field table
    local fourth_block_j = (fourth_block.x / block_size) + 2 -- calculates the horizontal index position in the field table

    -- check if there is a block directly to the right of the block
    if(field[first_block_i][first_block_j]:is(EmptyBlock) and field[second_block_i][second_block_j]:is(EmptyBlock) and field[third_block_i][third_block_j]:is(EmptyBlock) and field[fourth_block_i][fourth_block_j]:is(EmptyBlock)) then
        first_block.x = first_block.x + block_size
        second_block.x = second_block.x + block_size
        third_block.x = third_block.x + block_size
        fourth_block.x = fourth_block.x + block_size
    else 
        print('collision detected')
    end
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