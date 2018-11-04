local I = Tetromino:extend()

local state = 1

-- this block is initially lying down and aligned like this (from left to right): block_one block_two block_three block_four 
-- the passed parameters will be assigned to block_one
-- the values for block_two, block_three and block_four will be calculated from the passed parameters
function I:new(x, y)
	I.super.new(self)
	self.block_one = Block(x, y)
	self.block_two = Block(x + (block_size * 1), y)
	self.block_three = Block(x + (block_size * 2), y)
	self.block_four = Block(x + (block_size * 3), y)
end

function I:up()
	if(state == 1) then
		local success = I:rotateClockwise(I.block_three, I.block_one, I.block_two, I.block_four)
		if(success) then
			state = 2
		end
	elseif(state == 2) then
		local success = I:rotateCounterClockwise(I.block_three, I.block_one, I.block_two, I.block_four)
		if(success) then
			state = 1
		end
	end
end

function I:update(dt)

end

function I:draw()
	love.graphics.setColor(0.039, 0.607, 1.0)
	I.super.draw(self)
end

return I
