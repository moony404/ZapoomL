-- game run with love2d 11.4 library and it's made in Lua
-- variables
function love.load() -- love2d's function to load some code before launch
   -- libraries
   anim8 = require('libraries/anim8') -- imported anim8.lua from the libraries folder in ZapoomL
   -- variables
   player = {} -- player table
   player.animations = {} -- player.animations table
   player.x = 0 -- the x coordinates of the player
   player.y = 0 -- the y coordinates of the player
   player.speed = 200 -- the speed of the player & this variable is used to calculate the movement of the player
   -- img variables
   player.sprite = love.graphics.newImage('img/player.png') -- add the player sprite image
   player.spriteSheet = love.graphics.newImage('img/player-sheet.png') -- add the payer sprite sheet image
   player.grid = anim8.newGrid(12 , 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight()) -- slice the player.spriteSheet to animated it later
   player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2)
   background = love.graphics.newImage('img/background.png') -- add the background image
end
-- window settings
love.window.setTitle("ZapoomL") -- the title of the window
love.window.setFullscreen(true) -- make the window of ZapoomL in fullscreen mode so it fit on all monitor/screen
-- the draw function draws the player and the background
function love.draw() -- love2d's function to draw somthing on the screen
   love.graphics.draw(background) -- draw the background
   player.animations.down:draw(player.spriteSheet, player.x, player.y, 0, 3) -- draw the player sprite at 0° rotation and 3 scale
end
-- love2d's function
function love.update(dt) -- love2d's function to run the game smoothly on any device with the dt variable, the function is like a infinite loop
   -- player movement
   -- right
   if love.keyboard.isDown("right") then -- check if the right arrow key is down
      player.x = player.x + player.speed * dt
   end
   -- left
   if love.keyboard.isDown("left") then -- check if the left arrow key is down
      player.x = player.x - player.speed * dt
   end
   -- down
   if love.keyboard.isDown("down") then -- check if the down arrow key is down
      player.y = player.y + player.speed * dt
   end
   -- up
   if love.keyboard.isDown("up") then -- check if the up arrow key is down
      player.y = player.y - player.speed * dt
   end
   -- shortcut for keyboard
   if love.keyboard.isDown("backspace") then -- check if the backspace key is down
      love.window.close() -- close the window
   end
   if love.keyboard.isDown("lctrl") then -- check if the left control key is down
      love.window.minimize() -- minimize the window
   end
   player.animations.down:update(dt)
end