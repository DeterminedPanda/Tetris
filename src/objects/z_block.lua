local Z = Tetromino:extend()

--this block is initially locking like a Z. The blocks are aligned as following:
-- block_one block_two
-- 			block_three block_four

local state = 1

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
function Z:state_one()
	local block_one_i = (Z.block_one.y / block_size)	
	local block_one_j = (Z.block_one.x / block_size) + 3
	local block_two_i = (Z.block_two.y / block_size) + 1 
	local block_two_j =  (Z.block_two.x / block_size) + 2
	local block_three_i =  (Z.block_three.y / block_size) 
	local block_three_j = (Z.block_three.x / block_size) + 1
	local block_four_i = (Z.block_four.y / block_size) + 1 
	local block_four_j = (Z.block_four.x / block_size)

	if(field[block_one_i][block_one_j]:is(EmptyBlock) and field[block_two_i][block_two_j]:is(EmptyBlock) and field[block_three_i][block_three_j]:is(EmptyBlock) and field[block_four_i][block_four_j]:is(EmptyBlock)) then
		Z.block_one.y = (block_one_i - 1) * block_size
		Z.block_one.x = (block_one_j - 1) * block_size
		Z.block_two.y = (block_two_i - 1) * block_size
		Z.block_two.x = (block_two_j - 1) * block_size
		Z.block_three.y = (block_three_i - 1) * block_size
		Z.block_three.x = (block_three_j - 1) * block_size
		Z.block_four.y = (block_four_i - 1) * block_size
		Z.block_four.x = (block_four_j - 1) * block_size
		return true
	else
		print('collision detected')
		return false
	end
end

-- the block will change when able to this position:
--			block_one block_two
--					 block_three block_four
function Z:state_two() 
		
	return false
end

function Z:update(dt)

end

function Z:draw()
	love.graphics.setColor(0, 1, 0)
	Z.super.draw(self)
end

return Z
