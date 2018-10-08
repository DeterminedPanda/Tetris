local TeeBlock = Tetromino:extend()

-- this block is initially looking like a upside down T. they are aligned like this: 
-- block_two block_three block_four
--             block_one

local state = 1

-- the passed parameters will be assigned to block_one.
-- the values for block_three, block_four and block_two will be calculated from the passed parameters
function TeeBlock:new(x, y, width, height)
	TeeBlock.super.new(self)
	TeeBlock.block_one = Block(x, y, width, height)
	TeeBlock.block_two = Block(x - block_size, y - block_size, width, height)
	TeeBlock.block_three = Block(x, y - block_size, width, height)
	TeeBlock.block_four = Block(x + block_size, y - block_size, width, height)
end

function TeeBlock:up()
	if(state == 1) then
		local success = self:state_one()
		if(success) then
			state = 2
		end
	elseif(state == 2) then
		local success = self:state_two()
		if(success) then
			state = 3
		end
	elseif(state == 3) then
		local success = self:state_three()
		if(success) then
			state = 4
		end
	elseif(state == 4) then
		local success = self:state_four()
		if(success) then
			state = 1
		end
	end
end

-- the block will change when able to this position:
--				block_two
--	block_one	block_three 
--			 	block_four
function TeeBlock:state_one()
	local bottom_i = (TeeBlock.block_one.y / block_size)
	local bottom_j = (TeeBlock.block_one.x / block_size)
	local left_i = (TeeBlock.block_two.y / block_size) + 2
	local center_i = (TeeBlock.block_three.y / block_size) + 1
	local right_i = (TeeBlock.block_four.y / block_size)
	local right_group_j = (TeeBlock.block_three.x / block_size) + 1 -- calculates the horizontal position of block_two, block_three and block_four

	if(field[bottom_i][bottom_j]:is(EmptyBlock) and field[left_i][right_group_j]:is(EmptyBlock) and field[center_i][right_group_j]:is(EmptyBlock) and field[right_i][right_group_j]:is(EmptyBlock)) then
		TeeBlock.block_one.y = (bottom_i - 1) * block_size
		TeeBlock.block_one.x = (bottom_j - 1) * block_size
		TeeBlock.block_two.y = (left_i - 1) * block_size
		TeeBlock.block_two.x = (right_group_j - 1) * block_size
		TeeBlock.block_three.y = (center_i - 1) * block_size
		TeeBlock.block_three.x = (right_group_j - 1) * block_size
		TeeBlock.block_four.y = (right_i - 1) * block_size
		TeeBlock.block_four.x = (right_group_j - 1) * block_size
		return true
	else 
		print('collision detected')
		return false
	end
end

-- the block will change when able to this position:
--					block_one	
--		block_four block_three block_two	
--
function TeeBlock:state_two()
	local bottom_i = (TeeBlock.block_one.y / block_size) 
	local bottom_j = (TeeBlock.block_one.x / block_size) + 2
	local lower_group_i = (TeeBlock.block_three.y / block_size) + 1
	local left_j = (TeeBlock.block_two.x / block_size) 
	local center_j = (TeeBlock.block_three.x / block_size) + 1
	local right_j = (TeeBlock.block_four.x / block_size) + 2

	if(field[bottom_i][bottom_j]:is(EmptyBlock) and field[lower_group_i][left_j]:is(EmptyBlock) and field[lower_group_i][center_j]:is(EmptyBlock) and field[lower_group_i][right_j]:is(EmptyBlock)) then
		TeeBlock.block_one.y = (bottom_i - 1) * block_size
		TeeBlock.block_one.x = (bottom_j - 1) * block_size
		TeeBlock.block_two.y = (lower_group_i - 1) * block_size
		TeeBlock.block_two.x = (left_j - 1) * block_size
		TeeBlock.block_three.y = (lower_group_i - 1) * block_size
		TeeBlock.block_three.x = (center_j - 1) * block_size
		TeeBlock.block_four.y = (lower_group_i - 1) * block_size
		TeeBlock.block_four.x = (right_j - 1) * block_size
		return true
	else
		print('collision detected')
		return false
	end
end

-- the block will change when able to this position:
--					block_four
--					block_three	block_one
--					block_two
function TeeBlock:state_three()
	local bottom_i = (TeeBlock.block_one.y / block_size) + 2
	local bottom_j = (TeeBlock.block_one.x / block_size) + 2
	local left_i = (TeeBlock.block_two.y / block_size) 
	local center_i = (TeeBlock.block_three.y / block_size) + 1
	local right_i = (TeeBlock.block_four.y / block_size) + 2
	local left_group_j = (TeeBlock.block_three.x / block_size) + 1

	if(field[bottom_i][bottom_j]:is(EmptyBlock) and field[left_i][left_group_j]:is(EmptyBlock) and field[center_i][left_group_j]:is(EmptyBlock) and field[right_i][left_group_j]:is(EmptyBlock)) then
		TeeBlock.block_one.y = (bottom_i - 1) * block_size
		TeeBlock.block_one.x = (bottom_j - 1) * block_size
		TeeBlock.block_two.y = (left_i - 1) * block_size
		TeeBlock.block_two.x = (left_group_j - 1) * block_size
		TeeBlock.block_three.y = (center_i - 1) * block_size
		TeeBlock.block_three.x = (left_group_j - 1) * block_size
		TeeBlock.block_four.y = (right_i - 1) * block_size
		TeeBlock.block_four.x = (left_group_j - 1) * block_size
		return true
	else 
		print('collision detected')
		return false
	end
end

-- the block will change when able to this positon:
--
--		block_two block_three block_four
--				block_one
function TeeBlock:state_four()
	local bottom_i = (TeeBlock.block_one.y / block_size) + 2
	local bottom_j = (TeeBlock.block_one.x / block_size) 
	local upper_group_i = (TeeBlock.block_three.y / block_size) + 1
	local left_j = (TeeBlock.block_two.x / block_size) + 2
	local center_j = (TeeBlock.block_three.x / block_size) + 1
	local right_j = (TeeBlock.block_four.x / block_size)

	if(field[bottom_i][bottom_j]:is(EmptyBlock) and field[upper_group_i][left_j]:is(EmptyBlock) and field[upper_group_i][center_j]:is(EmptyBlock) and field[upper_group_i][right_j]:is(EmptyBlock)) then
		TeeBlock.block_one.y = (bottom_i - 1) * block_size
		TeeBlock.block_one.x = (bottom_j - 1) * block_size
		TeeBlock.block_two.y = (upper_group_i - 1) * block_size
		TeeBlock.block_two.x = (left_j - 1) * block_size
		TeeBlock.block_three.y = (upper_group_i - 1) * block_size
		TeeBlock.block_three.x = (center_j - 1) * block_size
		TeeBlock.block_four.y = (upper_group_i - 1) * block_size
		TeeBlock.block_four.x = (right_j - 1) * block_size
		return true
	else
		print('collision detected')
		return false
	end
end

function TeeBlock:update(dt)

end

function TeeBlock:draw()
	love.graphics.setColor(0.500, 0.500, 0)
	TeeBlock.super.draw(self)
end

return TeeBlock
