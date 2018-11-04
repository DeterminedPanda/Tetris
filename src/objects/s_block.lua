local S = Tetromino:extend()

local state = 1

-- this block is initially looking like a S and will be aligned like this:
-- 				block_one block_two
-- 	block_three block_four
-- the passed parameters will be assigned to block_one.
-- the values for block_two, block_two and block_three will be calculated from the passed parameters
function S:new(x, y)
	S.super.new(self)
	self.block_one = Block(x, y)
	self.block_two = Block(x + block_size, y)
	self.block_three = Block(x - block_size, y + block_size) 
	self.block_four = Block(x, y + block_size)
end

function S:up()
	if(state == 1) then
		local success = S:rotateCounterClockwise(S.block_one, S.block_two, S.block_three, S.block_four)
		if(success) then
			state = 2
		end
	elseif(state == 2) then
		local success = S:rotateClockwise(S.block_one, S.block_two, S.block_three, S.block_four)
		if(success) then
			state = 1
		end
	end
end

function S:update(dt)

end

function S:draw()
	love.graphics.setColor(0.239, 1.0, 0.796)
	S.super.draw(self)
end

return S 
