local StraightBlock = Tetromino:extend()

-- this block is initially lying down and aligned like this (from left to right): block_one block_two block_three block_four 

<<<<<<< HEAD
local state = 1

-- the passed parameters will be assigned to block_one
-- the values for block_two, block_three and block_four will be calculated from the passed parameters
function StraightBlock:new(x, y, width, height)
	StraightBlock.super.new(self)
	StraightBlock.block_one = Block(x, y, width, height)
	StraightBlock.block_two = Block(x + (block_size * 1), y, width, height)
	StraightBlock.block_three = Block(x + (block_size * 2), y, width, height)
	StraightBlock.block_four = Block(x + (block_size * 3), y, width, height)
=======
local block_one = nil
local block_two = nil
local block_three = nil
local block_four = nil
local state = 1

-- the passed parameters will be assigned to the block_one.
-- the values for block_two, block_three and block_four will be calculated from the passed parameters
-- this block is initially lying down and aligned like this:
-- block_one block_two block_three block_four
function StraightBlock:new(x, y, width, height)
	block_one = Block(x, y, width, height)
	block_two = Block(x + (block_size * 1), y, width, height)
	block_three = Block(x + (block_size * 2), y, width, height)
	block_four = Block(x + (block_size * 3), y, width, height)
>>>>>>> b926e54b9ac91305fc63a50b0fdcef75d1acbb90
end

function StraightBlock:up()
	if(state == 1) then -- the block will change its position from a lying to a standing position
		local success = self:state_one()
		if(success) then
			state = 2
		end
	elseif(state == 2) then -- the block will change its position from a standing to a lying position
		local success = self:state_two()
		if(success) then
			state = 1
		end
	end
end

-- changes the block from a lying position to a standing position:
-- block_one
-- block_two
-- block_three
-- block_four
function StraightBlock:state_one()
<<<<<<< HEAD
	local j = (StraightBlock.block_three.x / block_size) + 1 
	local block_one_i = (StraightBlock.block_three.y / block_size) - 1 -- calculates the new vertical index position in the field table
	local block_two_i = (StraightBlock.block_three.y / block_size) -- calculates the new vertical index position in the field table
	local block_four_i = (StraightBlock.block_three.y / block_size) + 2 -- calculates the new vertical index position in the field table

	if(field[block_one_i][j]:is(EmptyBlock) and field[block_two_i][j]:is(EmptyBlock) and field[block_four_i][j]:is(EmptyBlock)) then
		StraightBlock.block_one.y = (block_one_i - 1) * block_size
		StraightBlock.block_two.y = (block_two_i - 1) * block_size
		StraightBlock.block_four.y = (block_four_i - 1) * block_size
		StraightBlock.block_one.x, StraightBlock.block_two.x, StraightBlock.block_four.x = StraightBlock.block_three.x, StraightBlock.block_three.x, StraightBlock.block_three.x
=======
	local j = (block_three.x / block_size) + 1 
	local block_one_i = (block_three.y / block_size) - 1 -- calculates the new vertical index position in the field table
	local block_two_i = (block_three.y / block_size) -- calculates the new vertical index position in the field table
	local block_four_i = (block_three.y / block_size) + 2 -- calculates the new vertical index position in the field table

	if(field[block_one_i][j]:is(EmptyBlock) and field[block_two_i][j]:is(EmptyBlock) and field[block_four_i][j]:is(EmptyBlock)) then
		block_one.y = (block_one_i - 1) * block_size
		block_two.y = (block_two_i - 1) * block_size
		block_four.y = (block_four_i - 1) * block_size
		block_one.x, block_two.x, block_four.x = block_three.x, block_three.x, block_three.x
>>>>>>> b926e54b9ac91305fc63a50b0fdcef75d1acbb90
		return true
	else
		print('collision detected')
		return false
	end
end

-- changes the block from a standing position to a lying position:
-- block_one block_two block_three block_four
function StraightBlock:state_two() 
<<<<<<< HEAD
	local i = (StraightBlock.block_three.y / block_size) + 1 -- calculates the horizontal index position in the field table
	local block_one_j = (StraightBlock.block_three.x / block_size) - 1 -- calculates the vertical index position in the field table
	local block_two_j = (StraightBlock.block_three.x / block_size) -- calculates the vertical index position in the field table
	local block_four_j = (StraightBlock.block_three.x / block_size) + 2 -- calculates the vertical index position in the field table

	if(field[i][block_one_j]:is(EmptyBlock) and field[i][block_two_j]:is(EmptyBlock) and field[i][block_four_j]:is(EmptyBlock)) then
		StraightBlock.block_one.x = (block_one_j - 1) * block_size
		StraightBlock.block_two.x = (block_two_j - 1) * block_size
		StraightBlock.block_four.x = (block_four_j - 1) * block_size
		StraightBlock.block_one.y, StraightBlock.block_two.y, StraightBlock.block_four.y = StraightBlock.block_three.y, StraightBlock.block_three.y, StraightBlock.block_three.y
=======
	local i = (block_three.y / block_size) + 1 -- calculates the horizontal index position in the field table
	local block_one_j = (block_three.x / block_size) - 1 -- calculates the vertical index position in the field table
	local block_two_j = (block_three.x / block_size) -- calculates the vertical index position in the field table
	local block_four_j = (block_three.x / block_size) + 2 -- calculates the vertical index position in the field table

	if(field[i][block_one_j]:is(EmptyBlock) and field[i][block_two_j]:is(EmptyBlock) and field[i][block_four_j]:is(EmptyBlock)) then
		block_one.x = (block_one_j - 1) * block_size
		block_two.x = (block_two_j - 1) * block_size
		block_four.x = (block_four_j - 1) * block_size
		block_one.y, block_two.y, block_four.y = block_three.y, block_three.y, block_three.y
>>>>>>> b926e54b9ac91305fc63a50b0fdcef75d1acbb90
		return true
	else
		print('collsion detected')
		return false
	end
end

<<<<<<< HEAD
=======
function StraightBlock:left()
	if(isLeftEmpty(block_one, block_two, block_three, block_four)) then
		moveLeft(block_one, block_two, block_three, block_four)
	end
end

function StraightBlock:down()
	if(isDownEmpty(block_one, block_two, block_three, block_four)) then
		moveDown(block_one, block_two, block_three, block_four)
	end
end

function StraightBlock:right()
	if(isRightEmpty(block_one, block_two, block_three, block_four)) then
		moveRight(block_one, block_two, block_three, block_four)
	end
end

>>>>>>> b926e54b9ac91305fc63a50b0fdcef75d1acbb90
function StraightBlock:update(dt)

end

function StraightBlock:draw()
	love.graphics.setColor(0, 0.5, 0)
<<<<<<< HEAD
	StraightBlock.super.draw(self)
=======
	block_one:draw()
	block_two:draw()
	block_three:draw()
	block_four:draw()
>>>>>>> b926e54b9ac91305fc63a50b0fdcef75d1acbb90
end

return StraightBlock
