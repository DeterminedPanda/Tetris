local Straight = Tetromino:extend()

local state = 1

-- this block is initially lying down and aligned like this (from left to right): block_one block_two block_three block_four 
-- the passed parameters will be assigned to block_one
-- the values for block_two, block_three and block_four will be calculated from the passed parameters
function Straight:new(x, y, width, height)
	Straight.super.new(self)
	Straight.block_one = Block(x, y, width, height)
	Straight.block_two = Block(x + (block_size * 1), y, width, height)
	Straight.block_three = Block(x + (block_size * 2), y, width, height)
	Straight.block_four = Block(x + (block_size * 3), y, width, height)
end

function Straight:up()
	if(state == 1) then -- the block will change its position from a lying to a standing position
		local success = Straight:rotateClockwise(Straight.block_three, Straight.block_one, Straight.block_two, Straight.block_four)
		if(success) then
			state = 2
		end
	elseif(state == 2) then -- the block will change its position from a standing to a lying position
		local success = Straight:rotateCounterClockwise(Straight.block_three, Straight.block_one, Straight.block_two, Straight.block_four)
		if(success) then
			state = 1
		end
	end
end

function Straight:update(dt)

end

function Straight:draw()
	love.graphics.setColor(0, 0.5, 0)
	Straight.super.draw(self)
end

return Straight
