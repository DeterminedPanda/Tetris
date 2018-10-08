local ESSBlock = Tetromino:extend()

local state = 1

-- the passed parameters will be assigned to block_one.
-- the values for block_two, block_two and block_three will be calculated from the passed parameters
-- this block is initially looking like a S and will be aligned like this:
-- 				block_one block_two
-- 	block_three block_four
function SBlock:new(x, y, width, height)
	ESSBlock.super.new(self)
	ESSBlock.block_one = Block(x, y, width, height)
	ESSBlock.block_two = Block(x + block_size, y, width, height)
	ESSBlock.block_three = Block(x - block_size, y + block_size, width, height) 
	ESSBlock.block_four = Block(x, y + block_size, width, height)
end

function SBlock:up()
	if(state == 1) then
		local success = self:state_one()
		if(success) then
			state = 2
		end
	elseif(state == 2) then
		local success = self:state_two()
		if(success) then
			state = 1
		end
	end
end

function SBlock:state_one()
	local block_one_i = 0 
	local block_one_j = 0
	if(field[block_one_i][block_one_j]:is(EmptyBlock)) then
		ESSBlock.block_one.y = (block_one_i - 1) * block_size
		ESSBlock.block_one.x = (block_one_j - 1) * block_size
		return true
	else
		print('collision detected')
		return false
	end
end


function SBlock:state_two()

	return false
end

function SBlock:update(dt)

end

function SBlock:draw()
	love.graphics.setColor(0, 0, 1)
	ESSBlock.super.draw(self)
end

return ESSBlock
