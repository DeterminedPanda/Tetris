local Z = Tetromino:extend()

local state = 1

--this block is initially locking like a Z. The blocks are aligned as following:
-- block_one block_two
-- 			block_three block_four
-- the passed parameters will be assigned to block_one.
-- the values for block_two, block_three and block_four will be calculated from the passed parameters.
function Z:new(x, y, width, height)
	Z.super.new(self)
	Z.block_one = Block(x, y, width, height)
	Z.block_two = Block(x + block_size, y, width, height)
	Z.block_three = Block(x + block_size, y + block_size, width, height)
	Z.block_four = Block(x + (block_size * 2), y + block_size, width, height)
end

function Z:up()
	if(state == 1) then
		local success = Z:rotateCounterClockwise(Z.block_two, Z.block_one, Z.block_three, Z.block_four)
		if(success) then
			state = 2
		end
	elseif(state == 2) then
		local success = Z:rotateCounterClockwise(Z.block_two, Z.block_one, Z.block_three, Z.block_four)

		if(success) then
			state = 1
		end
	end
end 

function Z:update(dt)

end

function Z:draw()
	love.graphics.setColor(0, 1, 0)
	Z.super.draw(self)
end

return Z
