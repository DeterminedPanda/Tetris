local SBlock = Object:extend()

local block_one = nil
local block_two = nil
local block_three = nil
local block_four = nil
local state = 1

-- the passed parameters will be assigned to block_one.
-- the values for block_two, block_two and block_three will be calculated from the passed parameters
-- this block is initially looking like a S and will be aligned like this:
-- 				block_one block_two
-- 	block_three block_four
function SBlock:new(x, y, width, height)
	block_one = Block(x, y, width, height)
	block_two = Block(x + block_size, y, width, height)
	block_three = Block(x - block_size, y + block_size, width, height) 
	block_four = Block(x, y + block_size, width, height)
end

function SBlock:up()
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

function SBlock:state_one()
	local block_one_i =0 
	local block_one_j =0
	if(field[block_one_i][block_one_j]:is(EmptyBlock)) then
		block_one.y = (block_one_i - 1) * block_size
		block_one.x = (block_one_j - 1) * block_size
		return true
	else
		print('collision detected')
		return false
	end
end


function SBlock:state_two()

	return false
end

function SBlock:left()
	if(isLeftEmpty(block_one, block_two, block_three, block_four)) then
		moveLeft(block_one, block_two, block_three, block_four)
	end
end

function SBlock:down()
	if(isDownEmpty(block_one, block_two, block_three, block_four)) then
		moveDown(block_one, block_two, block_three, block_four)
	end
end

function SBlock:right()
	if(isRightEmpty(block_one, block_two, block_three, block_four)) then
		moveRight(block_one, block_two, block_three, block_four)
	end
end

function SBlock:update(dt)

end

function SBlock:draw()
	love.graphics.setColor(0, 0, 1)
	block_one:draw()
	block_two:draw()
	block_three:draw()
	block_four:draw()
end

return SBlock
