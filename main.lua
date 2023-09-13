-- game run with love2d 11.4 library and it's made in Lua
-- variables
function love.load() -- love2d's function to load some code before launch
   -- libraries
   anim8 = require('libraries/anim8')
   -- variables
   player = {}
   player.x = 0 -- the x coordinates of the player
   player.y = 0 -- the y coordinates of the player
   player.speed = 200 -- the speed of the player & this variable is used to calculate the movement of the player
   -- img variables
   player.sprite = love.graphics.newImage('img/player.png')
   player.spriteSheet = love.graphics.newImage('img/player-sheet.png')
   -- slice the player.spriteSheet to animated it later
   player.grid = anim8.newGrid(12 , 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
   background = love.graphics.newImage('img/background.png')
end
-- window settings
love.window.setMode(1920, 1080) -- the size of the window (16;9 / 1920x1080[widthx])
love.window.setTitle("ZapoomL") -- the title of the window
-- the draw function draws the player and the background
function love.draw()
   love.graphics.draw(background) -- draw the background
   love.graphics.draw(player.sprite, player.x, player.y, 0, 1.5) -- draw the player sprite
end
-- love2d's function
function love.update(dt)
   -- player movement
   -- right
   if love.keyboard.isDown("right") then
      player.x = player.x + player.speed * dt
   end
   -- left
   if love.keyboard.isDown("left") then
      player.x = player.x - player.speed * dt
   end
   -- down
   if love.keyboard.isDown("down") then
      player.y = player.y + player.speed * dt
   end
   -- up
   if love.keyboard.isDown("up") then
      player.y = player.y - player.speed * dt
   end
   -- shortcut for keyboard
   if love.keyboard.isDown("backspace") then -- backspace key is to close the window
      love.window.close() -- to close the window
   end
   if love.keyboard.isDown("lctrl") then -- left control key is to minimize the window
      love.window.minimize() -- to minimize the window
   end
   -- close the app keybind
end