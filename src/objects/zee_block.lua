local ZeeBlock = Tetromino:extend()

--this block is initially locking like a Z. The blocks are aligned as following:
-- block_one block_two
-- 			block_three block_four

local state = 1

-- the passed parameters will be assigned to block_one.
-- the values for block_two, block_three and block_four will be calculated from the passed parameters.
function ZeeBlock:new(x, y, width, height)
	ZeeBlock.super.new(self)
	ZeeBlock.block_one = Block(x, y, width, height)
	ZeeBlock.block_two = Block(x + block_size, y, width, height)
	ZeeBlock.block_three = Block(x + block_size, y + block_size, width, height)
	ZeeBlock.block_four = Block(x + (block_size * 2), y + block_size, width, height)
end

function ZeeBlock:up()
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

-- the block will change when able to this position:
--						block_one
--		block_three	block_two
--		block_four
function ZeeBlock:state_one()
	local block_one_i = (ZeeBlock.block_one.y / block_size)	
	local block_one_j = (ZeeBlock.block_one.x / block_size) + 3
	local block_two_i = (ZeeBlock.block_two.y / block_size) + 1 
	local block_two_j =  (ZeeBlock.block_two.x / block_size) + 2
	local block_three_i =  (ZeeBlock.block_three.y / block_size) 
	local block_three_j = (ZeeBlock.block_three.x / block_size) + 1
	local block_four_i = (ZeeBlock.block_four.y / block_size) + 1 
	local block_four_j = (ZeeBlock.block_four.x / block_size)

	if(field[block_one_i][block_one_j]:is(EmptyBlock) and field[block_two_i][block_two_j]:is(EmptyBlock) and field[block_three_i][block_three_j]:is(EmptyBlock) and field[block_four_i][block_four_j]:is(EmptyBlock)) then
		ZeeBlock.block_one.y = (block_one_i - 1) * block_size
		ZeeBlock.block_one.x = (block_one_j - 1) * block_size
		ZeeBlock.block_two.y = (block_two_i - 1) * block_size
		ZeeBlock.block_two.x = (block_two_j - 1) * block_size
		ZeeBlock.block_three.y = (block_three_i - 1) * block_size
		ZeeBlock.block_three.x = (block_three_j - 1) * block_size
		ZeeBlock.block_four.y = (block_four_i - 1) * block_size
		ZeeBlock.block_four.x = (block_four_j - 1) * block_size
		return true
	else
		print('collision detected')
		return false
	end
end

-- the block will change when able to this position:
--			block_one block_two
--					 block_three block_four
function ZeeBlock:state_two() 
		
	return false
end

function ZeeBlock:update(dt)

end

function ZeeBlock:draw()
	love.graphics.setColor(0, 1, 0)
	ZeeBlock.super.draw(self)
end

return ZeeBlock
