package.path = package.path .. ';../../libraries/?.lua;../objects/?.lua'
Object = require('classic')
Input = require('input')
GameField = require('game_field')
Block = require('block')
SquareBlock = require('square_block')

block_size = 40
field_width = 10
field_height = 22

function love.load() 
    love.window.setTitle("Tetris")
    love.window.setMode(800, block_size*field_height) --block_size*field_height equals the minimum height required to show all 22 rows of blocks
    love.graphics.setBackgroundColor(0.956, 0.258, 0.258)
    fillTable()
end

function love.update(dt) 

end

function love.draw()
   for i = 1, field_height do 
        for j = 1, field_width do
            if field[i][j] ~= nil then
                field[i][j]:draw()
            end
        end
    end
end