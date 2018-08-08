local ZBlock = Object:extend()

local block_one = nil
local block_two = nil
local block_three = nil
local bttom_right = nil
local state = 1

-- the passed parameters will be assigned to block_one.
-- the values for block_two, block_three and block_four will be calculated from the passed parameters.
-- this block is initially locking like a Z and will be aligned as following:
-- block_one block_two
-- 			block_three block_four
function ZBlock:new(x, y, width, height)
	block_one = Block(x, y, width, height)
	block_two = Block(x + block_size, y, width, height)
	block_three = Block(x + block_size, y + block_size, width, height)
	block_four = Block(x + (block_size * 2), y + block_size, width, height)
end

function ZBlock:up()
	if(state == 1) then
		local success = self:state_one()
		if(success) then
			state = 2
		end
	elseif(state == 2) then
		local success = self:state_two()
		if(success) then
			state = 1
		end
	end
end 

-- the block will change, when able to this position:
--				block_one
--	block_three	block_two
--	block_four
function ZBlock:state_one()
	local block_one_i = (block_one.y / block_size)	
	local block_one_j = (block_one.x / block_size) + 3
	local block_two_i = (block_two.y / block_size) + 1 
	local block_two_j =  (block_two.x / block_size) + 2
	local block_three_i =  (block_three.y / block_size) 
	local block_three_j = (block_three.x / block_size) + 1
	local block_four_i = (block_four.y / block_size) + 1 
	local block_four_j = (block_four.x / block_size)

	if(field[block_one_i][block_one_j]:is(EmptyBlock) and field[block_two_i][block_two_j]:is(EmptyBlock) and field[block_three_i][block_three_j]:is(EmptyBlock) and field[block_four_i][block_four_j]:is(EmptyBlock)) then
		block_one.y = (block_one_i - 1) * block_size
		block_one.x = (block_one_j - 1) * block_size
		block_two.y = (block_two_i - 1) * block_size
		block_two.x = (block_two_j - 1) * block_size
		block_three.y = (block_three_i - 1) * block_size
		block_three.x = (block_three_j - 1) * block_size
		block_four.y = (block_four_i - 1) * block_size
		block_four.x = (block_four_j - 1) * block_size
		return true
	else
		print('collision detected')
		return false
	end
end

-- the block will change, when able to this position:
--	block_one block_two
-- 			  block_three block_four
function ZBlock:state_two() 
	local block_one_i = (block_one.y / block_size) + 2
	local block_one_j = (block_one.x / block_size) - 1
	local block_two_i = (block_two.y / block_size) + 1
	local block_two_j = (block_two.x / block_size)
	local block_three_i = (block_three.y / block_size) + 2
	local block_three_j = (block_three.x / block_size) + 1
	local block_four_i = (block_four.y / block_size) + 1
	local block_four_j = (block_four.x / block_size) + 2

	if(field[block_one_i][block_one_j]:is(EmptyBlock) and field[block_two_i][block_two_j]:is(EmptyBlock) and field[block_three_i][block_three_j]:is(EmptyBlock) and field[block_four_i][block_four_j]:is(EmptyBlock)) then
		block_one.y = (block_one_i - 1) * block_size
		block_one.x = (block_one_j - 1) * block_size
		block_two.y = (block_two_i - 1) * block_size
		block_two.x = (block_two_j - 1) * block_size
		block_three.y = (block_three_i - 1) * block_size
		block_three.x = (block_three_j - 1) * block_size
		block_four.y = (block_four_i - 1) * block_size
		block_four.x = (block_four_j - 1) * block_size
		return true	
	else
		print('collision detected')
		return false
	end
end

function ZBlock:left()
	if(isLeftEmpty(block_one, block_two, block_three, block_four)) then
		moveLeft(block_one, block_two, block_three, block_four)
	end
end

function ZBlock:down()
	if(isDownEmpty(block_one, block_two, block_three, block_four)) then
		moveDown(block_one, block_two, block_three, block_four)
	end
end

function ZBlock:right()
	if(isRightEmpty(block_one, block_two, block_three, block_four)) then
		moveRight(block_one, block_two, block_three, block_four)
	end
end

function ZBlock:update(dt)

end

function ZBlock:draw()
	love.graphics.setColor(0, 1, 0)
	block_one:draw()
	block_two:draw()
	block_three:draw()
	block_four:draw()
end

return ZBlock
