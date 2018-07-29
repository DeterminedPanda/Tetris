local TeeBlock = Object:extend()

-- this block is initially looking like a upside down T. they are aligned like this: 
-- left_block center_block right_block
--             bottom_block
local left_block = nil
local center_block = nil
local bottom_block = nil
local right_block = nil
local state = 1

-- the passed parameters will be assigned to bottom_block.
-- the values for center_block, right_block and left_block will be calculated from the passed parameters
function TeeBlock:new(x, y, width, height)
	bottom_block = Block(x, y, width, height)
	left_block = Block(x - block_size, y - block_size, width, height)
	center_block = Block(x, y - block_size, width, height)
	right_block = Block(x + block_size, y - block_size, width, height)
end

function TeeBlock:up()
	if(state == 1) then
		self:state_one()
		state = 2
	elseif(state == 2) then
		self:state_two()
		state = 3
	elseif(state == 3) then
		self:state_three()
		state = 4
	elseif(state == 4) then
		self:state_four()
		state = 1
	end
end

function TeeBlock:state_one()
	local bottom_i = (bottom_block.y / block_size)
	local bottom_j = (bottom_block.x / block_size)
	local left_i = (left_block.y / block_size) + 2
	local center_i = (center_block.y / block_size) + 1
	local right_i = (right_block.y / block_size)
	local right_group_j = (center_block.x / block_size) + 1 -- calculates the horizontal position of the left_block, center_block and right_block

	if(field[bottom_i][bottom_j]:is(EmptyBlock) and field[left_i][right_group_j]:is(EmptyBlock) and field[center_i][right_group_j]:is(EmptyBlock) and field[right_i][right_group_j]:is(EmptyBlock)) then
		bottom_block.y = (bottom_i - 1) * block_size
		bottom_block.x = (bottom_j - 1) * block_size
		left_block.y = (left_i - 1) * block_size
		left_block.x = (right_group_j - 1) * block_size
		center_block.y = (center_i - 1) * block_size
		center_block.x = (right_group_j - 1) * block_size
		right_block.y = (right_i - 1) * block_size
		right_block.x = (right_group_j - 1) * block_size
	else 
		print('collision detected')
	end
end

function TeeBlock:state_two()
	local bottom_i = (bottom_block.y / block_size) 
	local bottom_j = (bottom_block.x / block_size) + 2
	local lower_group_i = (center_block.y / block_size) + 1
	local left_j = (left_block.x / block_size) 
	local center_j = (center_block.x / block_size) + 1
	local right_j = (right_block.x / block_size) + 2

	if(field[bottom_i][bottom_j]:is(EmptyBlock) and field[lower_group_i][left_j]:is(EmptyBlock) and field[lower_group_i][center_j]:is(EmptyBlock) and field[lower_group_i][right_j]:is(EmptyBlock)) then
		bottom_block.y = (bottom_i - 1) * block_size
		bottom_block.x = (bottom_j - 1) * block_size
		left_block.y = (lower_group_i - 1) * block_size
		left_block.x = (left_j - 1) * block_size
		center_block.y = (lower_group_i - 1) * block_size
		center_block.x = (center_j - 1) * block_size
		right_block.y = (lower_group_i - 1) * block_size
		right_block.x = (right_j - 1) * block_size
	else
		print('collision detected')
	end
end

function TeeBlock:state_three()
	local bottom_i = (bottom_block.y / block_size) + 2
	local bottom_j = (bottom_block.x / block_size) + 2
	local left_i = (left_block.y / block_size) 
	local center_i = (center_block.y / block_size) + 1
	local right_i = (right_block.y / block_size) + 2
	local left_group_j = (center_block.x / block_size) + 1

	if(field[bottom_i][bottom_j]:is(EmptyBlock) and field[left_i][left_group_j]:is(EmptyBlock) and field[center_i][left_group_j]:is(EmptyBlock) and field[right_i][left_group_j]:is(EmptyBlock)) then
		bottom_block.y = (bottom_i - 1) * block_size
		bottom_block.x = (bottom_j - 1) * block_size
		left_block.y = (left_i - 1) * block_size
		left_block.x = (left_group_j - 1) * block_size
		center_block.y = (center_i - 1) * block_size
		center_block.x = (left_group_j - 1) * block_size
		right_block.y = (right_i - 1) * block_size
		right_block.x = (left_group_j - 1) * block_size
	else 
		print('collision detected')
	end
end

function TeeBlock:state_four()
	local bottom_i = (bottom_block.y / block_size) + 2
	local bottom_j = (bottom_block.x / block_size) 
	local upper_group_i = (center_block.y / block_size) + 1
	local left_j = (left_block.x / block_size) + 2
	local center_j = (center_block.x / block_size) + 1
	local right_j = (right_block.x / block_size)

	if(field[bottom_i][bottom_j]:is(EmptyBlock) and field[upper_group_i][left_j]:is(EmptyBlock) and field[upper_group_i][center_j]:is(EmptyBlock) and field[upper_group_i][right_j]:is(EmptyBlock)) then
		bottom_block.y = (bottom_i - 1) * block_size
		bottom_block.x = (bottom_j - 1) * block_size
		left_block.y = (upper_group_i - 1) * block_size
		left_block.x = (left_j - 1) * block_size
		center_block.y = (upper_group_i - 1) * block_size
		center_block.x = (center_j - 1) * block_size
		right_block.y = (upper_group_i - 1) * block_size
		right_block.x = (right_j - 1) * block_size
	else
		print('collision detected')
	end
end

function TeeBlock:left()
	local is_bottom_movable = isLeftEmpty(field, bottom_block)
	local is_left_movable = isLeftEmpty(field, left_block)
	local is_center_movable = isLeftEmpty(field, center_block)
	local is_right_movable = isLeftEmpty(field, right_block)

	if(is_bottom_movable and is_left_movable and is_center_movable and is_right_movable) then
		moveLeft(bottom_block)
		moveLeft(left_block)
		moveLeft(center_block)
		moveLeft(right_block)
	else 
		print('collision detected')
	end
end

function TeeBlock:down()
	local is_bottom_movable = isDownEmpty(field, bottom_block)
	local is_left_movable = isDownEmpty(field, left_block)
	local is_center_movable = isDownEmpty(field, center_block)
	local is_right_movable = isDownEmpty(field, right_block)

	if(is_bottom_movable and is_left_movable and is_center_movable and is_right_movable) then
		moveBelow(bottom_block)
		moveBelow(left_block)
		moveBelow(center_block)
		moveBelow(right_block)
	else 
		print('collision detected')
	end
end

function TeeBlock:right()
	local is_bottom_movable = isRightEmpty(field, bottom_block)
	local is_left_movable = isRightEmpty(field, left_block)
	local is_center_movable = isRightEmpty(field, center_block)
	local is_right_movable = isRightEmpty(field, right_block)

	if(is_bottom_movable and is_left_movable and is_center_movable and is_right_movable) then
		moveRight(bottom_block)
		moveRight(left_block)
		moveRight(center_block)
		moveRight(right_block)
	else
		print('collision detected')
	end
end

function TeeBlock:update(dt)

end

function TeeBlock:draw()
	love.graphics.setColor(0.500, 0.500, 0)
	left_block:draw()
	center_block:draw()
	right_block:draw()
	bottom_block:draw()
end

return TeeBlock
