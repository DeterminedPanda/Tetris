local NextBlockWindow = Object:extend()

function NextBlockWindow:new()
	generateNextBlock()	
end

function NextBlockWindow:update(dt)

end

function NextBlockWindow:draw()
	love.graphics.setColor(1.0, 1.0, 1.0)
	love.graphics.rectangle('fill', 510, 50, 180, 180)
	next_block:draw()
end

function generateNextBlock()
	local random_number = love.math.random(1, 7)	
	local block_list = {IBlock, JBlock, LBlock, OBlock, SBlock, ZBlock, TBlock}
	next_block_index = random_number
	if(random_number == 1) then
		next_block = block_list[random_number](520, 120)
	elseif(random_number == 2) then
		next_block = block_list[random_number](540, 100)
	elseif(random_number == 3) then
		next_block = block_list[random_number](540, 100)
	elseif(random_number == 4)then
		next_block = block_list[random_number](560, 100)
	elseif(random_number == 5) then
		next_block = block_list[random_number](580, 100)
	elseif(random_number == 6)then
		next_block = block_list[random_number](540, 100)
	elseif(random_number == 7)then
		next_block = block_list[random_number](580, 140)
	end
end

function getNextBlock()
	--current_block = next_block
	--generateNextBlock()
end

return NextBlockWindow
