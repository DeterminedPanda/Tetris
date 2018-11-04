local O = Tetromino:extend()

-- the block will initialy be aligned like this:
-- block_one 	block_two
-- block_three 	block_four
-- the passed parameters will be assigned to block_one.
-- the values for block_two, block_three and block_four will be calculated from the passed parameters
function O:new(x, y) 
	O.super.new(self)
	self.block_one = Block(x, y)
	self.block_two = Block(x + block_size, y)
	self.block_three = Block(x, y + block_size)
	self.block_four = Block(x + block_size, y + block_size)
end

function O:up() 
	-- it is a cube, there is no point in rotating it
end

function O:draw()
	love.graphics.setColor(1.0, 0.819, 0.0)
	O.super.draw(self)
end

return O
