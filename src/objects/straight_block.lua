local StraightBlock = Object:extend()

local first_block = nil
local second_block = nil
local third_block = nil
local fourth_block = nil

function StraightBlock:new(x, y, width, height)
    first_block = Block(x, y, width, height)
    second_block = Block(x + (block_size * 1), y, width, height)
    third_block = Block(x + (block_size * 2), y, width, height)
    fourth_block = Block(x + (block_size * 3), y, width, height)
end

function StraightBlock:up()
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

function StraightBlock:left()
    local first_block_i = (first_block.y / block_size) + 1
    local first_block_j = (first_block.x / block_size)
    local second_block_i = (second_block.y / block_size) + 1
    local second_block_j = (second_block.x / block_size)
    local third_block_i = (third_block.y / block_size) + 1
    local third_block_j = (third_block.x / block_size)
    local fourth_block_i = (fourth_block.y / block_size) + 1
    local fourth_block_j = (fourth_block.x / block_size) 

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
    local first_block_i = (first_block.y / block_size) + 2
    local first_block_j = (first_block.x / block_size) + 1
    local second_block_i = (second_block.y / block_size) + 2
    local second_block_j = (second_block.x / block_size) + 1
    local third_block_i = (third_block.y / block_size) + 2
    local third_block_j = (third_block.x / block_size) + 1
    local fourth_block_i = (fourth_block.y / block_size) + 2
    local fourth_block_j = (fourth_block.x / block_size) + 1

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
    local first_block_i = (first_block.y / block_size) + 1
    local first_block_j = (first_block.x / block_size) + 2
    local second_block_i = (second_block.y / block_size) + 1
    local second_block_j = (second_block.x / block_size) + 2
    local third_block_i = (third_block.y / block_size) + 1
    local third_block_j = (third_block.x / block_size) + 2
    local fourth_block_i = (fourth_block.y / block_size) + 1
    local fourth_block_j = (fourth_block.x / block_size) + 2

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