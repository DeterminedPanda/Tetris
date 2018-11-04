local Tetromino = Object:extend()

function Tetromino:new()

end

function Tetromino:update(dt)

end

function Tetromino:draw()
	self.block_one:draw()
	self.block_two:draw()
	self.block_three:draw()
	self.block_four:draw()
end

function Tetromino:left()
	local is_block_one_movable = isLeftEmpty(self.block_one)
	local is_block_two_movable = isLeftEmpty(self.block_two)
	local is_block_three_movable = isLeftEmpty(self.block_three)
	local is_block_four_movable = isLeftEmpty(self.block_four)

	if(is_block_one_movable and is_block_two_movable and is_block_three_movable and is_block_four_movable) then
		moveLeft(self.block_one)
		moveLeft(self.block_two)
		moveLeft(self.block_three)
		moveLeft(self.block_four)
	else 
		print('collision detected')
	end
end

function Tetromino:down()
	local is_block_one_movable = isDownEmpty(self.block_one)
	local is_block_two_movable = isDownEmpty(self.block_two)
	local is_block_three_movable = isDownEmpty(self.block_three)
	local is_block_four_movable = isDownEmpty(self.block_four)

	if(is_block_one_movable and is_block_two_movable and is_block_three_movable and is_block_four_movable) then
		moveDown(self.block_one)
		moveDown(self.block_two)
		moveDown(self.block_three)
		moveDown(self.block_four)
	else 
		print('collision detected')
	end
end

function Tetromino:right()
	local is_block_one_movable = isRightEmpty(self.block_one)
	local is_block_two_movable = isRightEmpty(self.block_two)
	local is_block_three_movable = isRightEmpty(self.block_three)
	local is_block_four_movable = isRightEmpty(self.block_four)

	if(is_block_one_movable and is_block_two_movable and is_block_three_movable and is_block_four_movable) then
		moveRight(self.block_one)
		moveRight(self.block_two)
		moveRight(self.block_three)
		moveRight(self.block_four)
	else 
		print('collision detected')
	end
end

function Tetromino:rotateClockwise(pivot, ...) 
	local blocks = { ... }
	for key, value in pairs(blocks) do
		local i = value.y - pivot.y
		value.y = (pivot.y + value.x) - pivot.x
		value.x = pivot.x - i
	end
end

function Tetromino:rotateCounterClockwise(pivot, ...) 
	local blocks = { ... }
	for key, value in pairs(blocks) do
		local i = value.y - pivot.y	
		value.y = (pivot.y - value.x) + pivot.x
		value.x = pivot.x + i	
	end
end

return Tetromino
