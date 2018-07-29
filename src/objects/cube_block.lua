local Cube = Object:extend()

local top_left = nil
local top_right = nil
local bottom_left = nil 
local bottom_right = nil

-- the passed parameters will be assigned to the top_left block.
-- the values for top_right, bottom_left and bottom_right will be calculated from the passed parameters
function Cube:new(x, y, width, height) 
	top_left = Block(x, y, width, height)
	top_right = Block(x + block_size, y, width, height)
	bottom_left = Block(x, y + block_size, width, height)
	bottom_right = Block(x + block_size, y + block_size, width, height)
end

function Cube:up() 
	-- its a fucking cube, there is no point in rotating it
end

function Cube:left()
	local is_top_left_movable = isLeftEmpty(field, top_left)
	local is_top_right_movable = isLeftEmpty(field, top_right)
	local is_bottom_left_movable = isLeftEmpty(field, bottom_left)
	local is_bottom_right_movable = isLeftEmpty(field, bottom_right)

	if(is_top_left_movable and is_top_right_movable and is_bottom_left_movable and is_bottom_right_movable) then
		moveLeft(top_left)
		moveLeft(top_right)
		moveLeft(bottom_left)
		moveLeft(bottom_right)
	else 
		print('collision detected')
	end
end

function Cube:down() 
	local is_top_left_movable = isDownEmpty(field, top_left)
	local is_top_right_movable = isDownEmpty(field, top_right)
	local is_bottom_left_movable = isDownEmpty(field, bottom_left)
	local is_bottom_right_movable = isDownEmpty(field, bottom_right)

	if(is_top_left_movable and is_top_right_movable and is_bottom_left_movable and is_bottom_right_movable) then
		moveBelow(top_left)
		moveBelow(top_right)
		moveBelow(bottom_left)
		moveBelow(bottom_right)
	else 
		print('collision detected')
	end
end

function Cube:right()
	local is_top_left_movable = isRightEmpty(field, top_left)
	local is_top_right_movable = isRightEmpty(field, top_right)
	local is_bottom_left_movable = isRightEmpty(field, bottom_left)
	local is_bottom_right_movable = isRightEmpty(field, bottom_right)

	if(is_top_left_movable and is_top_right_movable and is_bottom_left_movable and is_bottom_right_movable) then
		moveRight(top_left)
		moveRight(top_right)
		moveRight(bottom_left)
		moveRight(bottom_right)
	else
		print('collision detected')
	end
end 

function Cube:update(dt) 

end

function Cube:draw()
	love.graphics.setColor(0.858, 0.662, 0)
	top_left:draw()
	top_right:draw()
	bottom_left:draw()
	bottom_right:draw()
end

return Cube
