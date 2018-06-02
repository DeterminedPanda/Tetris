package.path = package.path .. ';../../libraries/?.lua;../objects/?.lua'
Object = require('classic')
Input = require('input')
GameField = require('game_field')
Block = require('block')
EmptyBlock = require('empty_block')
Cube = require('cube_block')
DebugBlock = require('debug_block')
StraightBlock = require('straight_block')

block_size = 40
field_width = 10
field_height = 22

function love.load() 
    love.window.setTitle("Tetris")
    love.window.setMode(800, block_size * field_height) -- block_size * field_height equals the minimum height required to show all 22 rows of blocks
    love.graphics.setBackgroundColor(0.956, 0.258, 0.258)
    fillTable()

    ee = EmptyBlock(123, 456, 1000, 9000)
    print(ee.height)
    
    bb = DebugBlock(80, 80, 40, 40)
    field[3][3] = bb 
    cube = Cube(0, 0, block_size, block_size)
    input = Input()
    input:bind('up', function() cube:up() end)
    input:bind('left', function() cube:left() end)
    input:bind('down', function() cube:down() end)
    input:bind('right', function() cube:right() end)
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

    cube:draw()
end