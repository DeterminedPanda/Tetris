local T = Tetromino:extend()

local state = 1

-- this block is initially looking like a upside down T. they are aligned like this: 
-- block_two block_three block_four
--             block_one
-- the passed parameters will be assigned to block_one.
-- the values for block_three, block_four and block_two will be calculated from the passed parameters
function T:new(x, y)
	T.super.new(self)
	self.block_one = Block(x, y)
	self.block_two = Block(x - block_size, y - block_size)
	self.block_three = Block(x, y - block_size)
	self.block_four = Block(x + block_size, y - block_size)
end

function T:up()
	local success = self:rotateClockwise(self.block_three, self.block_one, self.block_two, self.block_four)
end

function T:update(dt)

end

function T:draw()
	love.graphics.setColor(1.0, 0.239, 0.474)
	T.super.draw(self)
end

return T
