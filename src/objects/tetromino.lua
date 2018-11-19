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
	local isEmpty = isLeftEmpty(self.block_one, self.block_two, self.block_three, self.block_four)

	if(isEmpty) then
		moveLeft(self.block_one, self.block_two, self.block_three, self.block_four)
	end
end

function Tetromino:down()
	local isEmpty = isDownEmpty(self.block_one, self.block_two, self.block_three, self.block_four)

	if(isEmpty) then
		moveDown(self.block_one, self.block_two, self.block_three, self.block_four)
	end
end

function Tetromino:right()
	local isEmpty = isRightEmpty(self.block_one, self.block_two, self.block_three, self.block_four)

	if(isEmpty) then
		moveRight(self.block_one, self.block_two, self.block_three, self.block_four)
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

-- TODO implement
function Tetromino:fuckshitup() 
	self.block_one.x = 40
	self.block_one.y = 40
end

return Tetromino
