package.path = package.path .. ';../../libraries/?.lua;../objects/?.lua;../model/?.lua'

Object = require('classic')
Input = require('input')
GameField = require('game_field')
NextBlockWindow = require('next_block_window')
SavedBlockWindow = require('saved_block_window')

Tetromino = require('tetromino')
Block = require('block')
EmptyBlock = require('empty_block')
DebugBlock = require('debug_block')
IBlock = require('i_block')
OBlock = require('o_block')
TBlock = require('t_block')
ZBlock = require('z_block')
SBlock = require('s_block')
LBlock = require('l_block')
JBlock = require('j_block')

block_size = 40
field_width = 10
field_height = 22

function love.load() 
	love.window.setTitle("Tetris")
	-- block_size * field_height equals the minimum height required to show all 22 rows of blocks
	love.window.setMode(800, block_size * field_height)
	love.graphics.setBackgroundColor(0.956, 0.258, 0.258)

	-- Debugging stuff
	gamefield = GameField()
	nextBlockWindow = NextBlockWindow()
	savedBlockWindow = SavedBlockWindow()
	field = gamefield.field
	current_block = TBlock(40, 40)
	debugblock = DebugBlock(160, 160, 40, 40)
	field[5][5] = debugblock
	input = Input()
	input:bind('up', function() current_block:up() end)
	input:bind('left', function() current_block:left() end)
	input:bind('down', function() current_block:down() end)
	input:bind('right', function() current_block:right() end)
	input:bind('lshift', function() saveCurrentBlock() end)
end

function love.update(dt) 

end

function love.draw()
	gamefield:draw()
	nextBlockWindow:draw()
	savedBlockWindow:draw()
	current_block:draw() -- TODO delete this
	debugblock:draw() -- TODO delete this
end
