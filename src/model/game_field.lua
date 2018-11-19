local GameField = Object:extend()

function GameField:new()
	self.field = { }
	self:fillTable()
end

function GameField:update(dt)

end

function GameField:draw()
	for i = 1, field_height do 
		for j = 1, field_width do
			self.field[i][j]:draw()
		end
	end
end

-- fills the table with placeholder blocks
function GameField:fillTable()
	local x = 0
	local y = 0

	for i = 1, field_height do
		self.field[i] = { }
		for j = 1, field_width do
			local empty_block = EmptyBlock(x, y)
			self.field[i][j] = empty_block 
			x = x + block_size
		end
		x = 0
		y = y + block_size
	end
end

function isInBounds(x, y) 
	return x >= 1 and x <= field_width
end

function isDownEmpty(...)
	local blocks = {...}

	for key, block in pairs(blocks) do
		local i = (block.y / block_size) + 2
		local j = (block.x / block_size) + 1
		local isInBounds = isInBounds(j, i)

		if(not isInBounds or not field[i][j]:is(EmptyBlock)) then
			return false
		end
	end

	return true
end

function moveDown(...)
	local blocks = {...}

	for key, block in pairs(blocks) do
		local i = (block.y / block_size) + 1
		block.y = i * block_size
	end
end

function isLeftEmpty(...)
	local blocks = {...}

	for key, block in pairs(blocks) do
		local i = (block.y / block_size) + 1 
		local j = (block.x / block_size)
		local isInBounds = isInBounds(j, i)

		if(not isInBounds or not field[i][j]:is(EmptyBlock)) then
			return false
		end
	end

	return true
end

function moveLeft(...)
	local blocks = { ... }

	for key, block in pairs(blocks) do
		local j = (block.x / block_size) - 1
		block.x = j * block_size
	end
end

function isRightEmpty(...)
	local blocks = {...}

	for key, block in pairs(blocks) do
		local i = (block.y / block_size) + 1 
		local j = (block.x / block_size) + 2
		local isInBounds = isInBounds(j, i)

		if(not isInBounds or not field[i][j]:is(EmptyBlock)) then
			return false
		end
	end

	return true
end

function moveRight(...)
	local blocks = { ... }

	for key, value in pairs(blocks) do
		local j = (value.x / block_size) + 1
		value.x = j * block_size
	end
end

return GameField
