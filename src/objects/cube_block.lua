local Cube = Tetromino:extend()

-- the passed parameters will be assigned to block_one.
-- the values for block_two, block_three and block_four will be calculated from the passed parameters
function Cube:new(x, y, width, height) 
	Cube.super.new(self)
	Cube.block_one = Block(x, y, width, height)
	Cube.block_two = Block(x + block_size, y, width, height)
	Cube.block_three = Block(x, y + block_size, width, height)
	Cube.block_four = Block(x + block_size, y + block_size, width, height)
	print(field)
end

function Cube:up() 
	-- it is a cube, there is no point in rotating it
end

function Cube:draw()
	love.graphics.setColor(0.858, 0.662, 0)
	Cube.super.draw(self)
end

return Cube
