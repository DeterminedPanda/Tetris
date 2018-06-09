local TeeBlock = Object:extend()

-- this block is initially looking like a upside down T. they are aligned like this: 
--             top_block
-- left_block center_block right_block
local left_block = nil
local center_block = nil
local top_block = nil
local right_block = nil
local state = 1

-- the passed parameters will be assigned to left_block.
-- the values for center_block, right_block and top_block will be calculated from the passed parameters
function TeeBlock:new(x, y, width, height)
    left_block = Block(x, y + block_size, width, height)
    center_block = Block(x + block_size, y + block_size, width, height)
    right_block = Block(x + (2 * block_size), y + block_size, width, height)
    top_block = Block(x + block_size, y, width, height)
end

function TeeBlock:up()
    if(state == 1) then
        self:state_one()
        state = 2
    elseif(state == 2) then
        self:state_two()
        state = 3
    elseif(state == 3) then
        self:state_three()
        state = 4
    elseif(state == 4) then
        self:state_four()
        state = 1
    end
end

function TeeBlock:state_one()

end

function TeeBlock:state_two()

end

function TeeBlock:state_three()

end

function TeeBlock:state_four()

end

function TeeBlock:left()

end

function TeeBlock:down()

end

function TeeBlock:right()

end

function TeeBlock:update(dt)

end

function TeeBlock:draw()
    love.graphics.setColor(0.500, 0.500, 0)
    left_block:draw()
    center_block:draw()
    right_block:draw()
    top_block:draw()
end

return TeeBlock