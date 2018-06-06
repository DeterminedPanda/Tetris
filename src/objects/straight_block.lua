local StraightBlock = Object:extend()

function StraightBlock:new(x, y, width, height)
    first_block = Block(x, y, width, height)
    second_block = Block(x + (block_size * 1), y, width, height)
    third_block = Block(x + (block_size * 2), y, width, height)
    fourth_block = Block(x + (block_size * 3), y, width, height)
end

function StraightBlock:up()
    -- TODO all wrong :(
    third_block_i = (third_block.y / block_size) + 1 -- TODO do I need these two vars?
    third_block_j = (third_block.x / block_size) + 1
    future_first_block_y = (third_block.y / block_size) - 2
    future_first_block_x = (third_block.x / block_size) + 1
    future_second_block_y = (third_block.y / block_size) - 1
    future_second_block_x = (third_block.x / block_size) or 1
    future_fourth_block_y = (third_block.y / block_size) + 1
    future_fourth_block_x = (third_block.x / block_size) or 1

    if(field[future_first_block_y][future_first_block_x]:is(EmptyBlock) and field[future_second_block_y][future_second_block_x]:is(EmptyBlock) and field[future_fourth_block_y][future_fourth_block_x]:is(EmptyBlock)) then
        first_block.y = (future_first_block_y + 0) * block_size 
        first_block.x = (future_first_block_x + 0) * block_size 
        second_block.y = (future_second_block_y + 0) * block_size
        second_block.x = (future_second_block_x + 0) * block_size
        fourth_block.y = (future_fourth_block_y + 0) * block_size
        fourth_block.x = (future_fourth_block_x + 0) * block_size
    else
        print('collision detected')
    end
end

function StraightBlock:left()
    first_block_i = (first_block.x / block_size) + 2
    first_block_j = (first_block.y / block_size) + 1
    second_block_i = (second_block.x / block_size) + 2


    first_block.x = first_block.x - block_size
    second_block.x = second_block.x - block_size
    third_block.x = third_block.x - block_size
    fourth_block.x = fourth_block.x - block_size
end

function StraightBlock:down()
    first_block_i = (first_block.y / block_size) + 2
    first_block_j = (first_block.x / block_size) + 1
    second_block_i = (second_block.y / block_size) + 2
    second_block_j = (second_block.x / block_size) + 1
    third_block_i = (third_block.y / block_size) + 2
    third_block_j = (third_block.x / block_size) + 1
    fourth_block_i = (fourth_block.y / block_size) + 2
    fourth_block_j = (fourth_block.x / block_size) + 1

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
    first_block.x = first_block.x + block_size
    second_block.x = second_block.x + block_size
    third_block.x = third_block.x + block_size
    fourth_block.x = fourth_block.x + block_size
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