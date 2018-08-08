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
			local empty_block = EmptyBlock(x, y, block_size - 1, block_size - 1)
			self.field[i][j] = empty_block 
			x = x + block_size
		end
		x = 0
		y = y + block_size
	end
end

function isInBounds(block) 

end

function isDownEmpty(...)
	local arg = { ... }
	for key, value in pairs(arg) do
		local i = (value.y / block_size) + 2
		local j = (value.x / block_size) + 1
		if(not field[i][j]:is(EmptyBlock)) then
			return false	
		end
	end
	return true
end

function moveDown(...)
	local arg = { ... }
	for key, value in pairs(arg) do
		local i = (value.y/ block_size) + 1
		value.y = i * block_size
	end
end

function isLeftEmpty(...)
	local arg = { ... }
	for key, value in pairs(arg) do
		local i = (value.y / block_size) + 1 
		local j = (value.x / block_size)
		if(not field[i][j]:is(EmptyBlock)) then
			return false	
		end
	end
	return true
end

function moveLeft(...)
	local arg = { ... }
	for key, value in pairs(arg) do
		local j = (value.x / block_size) - 1
		value.x = j * block_size
	end
end

function isRightEmpty(...)
	local arg = { ... }
	for key, value in pairs(arg) do
		local i = (value.y / block_size) + 1 
		local j = (value.x / block_size) + 2
		if(not field[i][j]:is(EmptyBlock)) then
			return false	
		end
	end
	return true
end

function moveRight(...)
	local arg = { ... }
	for key, value in pairs(arg) do
		local j = (value.x / block_size) + 1
		value.x = j * block_size
	end
end

return GameField
