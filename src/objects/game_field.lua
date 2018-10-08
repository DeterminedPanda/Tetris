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

function isDownEmpty(block)
	local i = (block.y / block_size) + 2
	local j = (block.x / block_size) + 1
	return field[i][j]:is(EmptyBlock)
end

function moveDown(block)
	local i = (block.y / block_size) + 1
	block.y = i * block_size
end

function isLeftEmpty(block)
	local i = (block.y / block_size) + 1 
	local j = (block.x / block_size)
	return field[i][j]:is(EmptyBlock) 
end

function moveLeft(block)
	local j = (block.x / block_size) - 1
	block.x = j * block_size
end

function isRightEmpty(block)
	local i = (block.y / block_size) + 1 
	local j = (block.x / block_size) + 2
	return field[i][j]:is(EmptyBlock)
end

function moveRight(block)
	local j = (block.x / block_size) + 1
	block.x = j * block_size
end

return GameField
