local Cube = Object:extend()

local block_one = nil
local block_two = nil
local block_three = nil 
local block_four = nil

-- the passed parameters will be assigned to the block_one block.
-- the values for block_two, block_three and block_four will be calculated from the passed parameters
-- initially the blocks of the Cube will be aligned like this:
-- block_one block_two
-- block_three block_four
function Cube:new(x, y, width, height) 
	block_one = Block(x, y, width, height)
	block_two = Block(x + block_size, y, width, height)
	block_three = Block(x, y + block_size, width, height)
	block_four = Block(x + block_size, y + block_size, width, height)
end

function Cube:up() 
	-- its a fucking cube, there is no point in rotating it
end

function Cube:left()
	if(isLeftEmpty(block_one, block_two, block_three, block_four)) then
		moveLeft(block_one, block_two, block_three, block_four)
	end
end

function Cube:down() 
	if(isDownEmpty(block_one, block_two, block_three, block_four)) then
		moveDown(block_one, block_two, block_three, block_four)
	end
end

function Cube:right()
	if(isRightEmpty(block_one, block_two, block_three, block_four)) then
		moveRight(block_one, block_two, block_three, block_four)
	end
end 

function Cube:update(dt) 

end

function Cube:draw()
	love.graphics.setColor(0.858, 0.662, 0)
	block_one:draw()
	block_two:draw()
	block_three:draw()
	block_four:draw()
end

return Cube
