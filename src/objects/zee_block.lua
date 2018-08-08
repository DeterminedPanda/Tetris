local ZeeBlock = Object:extend()

--this block is initially locking like a Z. The blocks are aligned as following:
-- top_left top_center
-- 			bottom_center bottom_right
local top_left = nil
local top_center = nil
local bottom_center = nil
local bttom_right = nil
local state = 1

-- the passed parameters will be assigned to top_left.
-- the values for top_center, bottom_center and bottom_right will be calculated from the passed parameters.
function ZeeBlock:new(x, y, width, height)
	top_left = Block(x, y, width, height)
	top_center = Block(x + block_size, y, width, height)
	bottom_center = Block(x + block_size, y + block_size, width, height)
	bottom_right = Block(x + (block_size * 2), y + block_size, width, height)
end

function ZeeBlock:up()
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

-- the block will change when able to this position:
--						top_left
--		bottom_center	top_center
--		bottom_right
function ZeeBlock:state_one()
	local top_left_i = (top_left.y / block_size)	
	local top_left_j = (top_left.x / block_size) + 3
	local top_center_i = (top_center.y / block_size) + 1 
	local top_center_j =  (top_center.x / block_size) + 2
	local bottom_center_i =  (bottom_center.y / block_size) 
	local bottom_center_j = (bottom_center.x / block_size) + 1
	local bottom_right_i = (bottom_right.y / block_size) + 1 
	local bottom_right_j = (bottom_right.x / block_size)

	if(field[top_left_i][top_left_j]:is(EmptyBlock) and field[top_center_i][top_center_j]:is(EmptyBlock) and field[bottom_center_i][bottom_center_j]:is(EmptyBlock) and field[bottom_right_i][bottom_right_j]:is(EmptyBlock)) then
		top_left.y = (top_left_i - 1) * block_size
		top_left.x = (top_left_j - 1) * block_size
		top_center.y = (top_center_i - 1) * block_size
		top_center.x = (top_center_j - 1) * block_size
		bottom_center.y = (bottom_center_i - 1) * block_size
		bottom_center.x = (bottom_center_j - 1) * block_size
		bottom_right.y = (bottom_right_i - 1) * block_size
		bottom_right.x = (bottom_right_j - 1) * block_size
		return true
	else
		print('collision detected')
		return false
	end
end

-- the block will change when able to this position:
--			top_left top_center
--					 bottom_center bottom_right
function ZeeBlock:state_two() 
		
	return false
end

function ZeeBlock:left()

end


function ZeeBlock:down()

end

function ZeeBlock:right()

end

function ZeeBlock:update(dt)

end

function ZeeBlock:draw()
	love.graphics.setColor(0, 1, 0)
	top_left:draw()
	top_center:draw()
	bottom_center:draw()
	bottom_right:draw()
end

return ZeeBlock
