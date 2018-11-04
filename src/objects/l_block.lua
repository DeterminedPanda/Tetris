local L = Tetromino:extend()

function L:new(x, y)
	L.super.new(self)
	self.block_one = Block(x, y)	
	self.block_two = Block(x + block_size, y)
	self.block_three = Block(x + (block_size * 2), y)
	self.block_four = Block(x, y + block_size)
end

function L:up()
	local success = L:rotateClockwise(L.block_two, L.block_one, L.block_three, L.block_four)
end

function L:update(dt)

end

function L:draw()
	love.graphics.setColor(1.0, 0.509, 0.039)
	L.super.draw(self)
end

return L
