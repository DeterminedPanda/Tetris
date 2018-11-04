local SavedBlockWindow = Object:extend()

saved_block = nil

function SavedBlockWindow:new()

end

function SavedBlockWindow:update(dt)

end

function SavedBlockWindow:draw()
	love.graphics.setColor(1.0, 1.0, 1.0)
	love.graphics.rectangle('fill', 510, 280, 180, 180)

	if(saved_block) then
	 	saved_block:draw()
	end
end

function saveCurrentBlock()
	current_block.x = 500
end

return SavedBlockWindow
