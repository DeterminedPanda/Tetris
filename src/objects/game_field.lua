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

return GameField