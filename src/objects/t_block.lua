local T = Tetromino:extend()

local state = 1

-- this block is initially looking like a upside down T. they are aligned like this: 
-- block_two block_three block_four
--             block_one
-- the passed parameters will be assigned to block_one.
-- the values for block_three, block_four and block_two will be calculated from the passed parameters
function T:new(x, y, width, height)
	T.super.new(self)
	T.block_one = Block(x, y, width, height)
	T.block_two = Block(x - block_size, y - block_size, width, height)
	T.block_three = Block(x, y - block_size, width, height)
	T.block_four = Block(x + block_size, y - block_size, width, height)
end

function T:up()
	local success = T:rotateClockwise(T.block_three, T.block_one, T.block_two, T.block_four)
end

function T:update(dt)

end

function T:draw()
	love.graphics.setColor(0.500, 0.500, 0)
	T.super.draw(self)
end

return T
