local J = Tetromino:extend()

function J:new(x, y)
	J.super.new(self)
	self.block_one = Block(x, y)
	self.block_two = Block(x + block_size, y)
	self.block_three = Block(x + (block_size * 2), y)
	self.block_four = Block(x + (block_size * 2), y + block_size)
end

function J:up()
	local success = J:rotateClockwise(J.block_two, J.block_one, J.block_three, J.block_four)
end

function J:update(dt)

end

function J:draw()
	love.graphics.setColor(0.929, 0.039, 1.0)
	J.super.draw(self)
end

return J
