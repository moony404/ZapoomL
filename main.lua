-- game run with love2d 11.4 library and it's made in Lua
-- variables
function love.load() -- love2d's function to load some code before launch
   -- libraries
   anim8 = require ('libraries/anim8') -- imported anim8.lua from the libraries folder in ZapoomL
   sti = require 'libraries/sti' -- imported sti from the libraries folder in ZapoomL
   gameMap = sti('maps/testMap.lua') -- make that gameMap is now egual to
   -- variables
   player = {} -- player table
   player.animations = {} -- player.animations table
   player.x = 0 -- the x coordinates of the player
   player.y = 0 -- the y coordinates of the player
   player.speed = 200 -- the speed of the player & this variable is used to calculate the movement of the player
   -- img variables
   player.sprite = love.graphics.newImage('img/player.png') -- add the player sprite image
   player.spriteSheet = love.graphics.newImage('img/player-sheet.png') -- add the payer sprite sheet image
   player.grid = anim8.newGrid(12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight()) -- slice the player.spriteSheet to animated it later
   player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2) -- create the down animation for the player
   player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2) -- create the left animation for the player
   player.animations.right = anim8.newAnimation(player.grid('1-4', 3), 0.2) -- create the right animation for the player
   player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.2) -- create the up animation for the player
   player.anim = player.animations.left -- player.anim is egual to player.animations.left
end
-- window settings
love.window.setTitle("ZapoomL") -- the title of the window
love.window.setFullscreen(true) -- make the window of ZapoomL in fullscreen mode
-- the draw function draws the player and the background
function love.draw() -- love2d's function to draw somthing on the screen
   gameMap:draw()
   player.anim:draw(player.spriteSheet, player.x, player.y, 0, 3) -- draw the player sprite at 0° rotation and 3 scale
end
-- love2d's function
function love.update(dt) -- love2d's function to run the game smoothly on any device with the dt variable, the function is like a infinite loop
   -- player movement
   local isMoving = false -- the local variable to define if the player is moving or not
   -- right
   if love.keyboard.isDown("right") then -- check if the right arrow key is down
      player.x = player.x + player.speed * dt -- make the player move right
      player.anim = player.animations.right -- give the player the right animation
      isMoving = true -- the player is moving
   end
   -- left
   if love.keyboard.isDown("left") then -- check if the left arrow key is down
      player.x = player.x - player.speed * dt -- make the player move left
      player.anim = player.animations.left -- give the player the left animation
      isMoving = true -- the player is moving
   end
   -- down
   if love.keyboard.isDown("down") then -- check if the down arrow key is down
      player.y = player.y + player.speed * dt -- make the player move down
      player.anim = player.animations.down -- give the player the down animation
      isMoving = true -- the player is moving
   end
   -- up
   if love.keyboard.isDown("up") then -- check if the up arrow key is down
      player.y = player.y - player.speed * dt -- make the player move up
      player.anim = player.animations.up -- give the player the up animation
      isMoving = true -- the player is moving
   end
   if isMoving == false then -- check if the player is not moving
      player.anim:gotoFrame(2) -- then id it's true (if the player is not moving), we gave the player the stand animation (so it's not an animation if he's standing lol)
   end
   -- shortcut for keyboard
   if love.keyboard.isDown("backspace") then -- check if the backspace key is down
      love.window.close() -- close the window
   end
   if love.keyboard.isDown("lctrl") then -- check if the left control key is down
      love.window.minimize() -- minimize the window
   end
   player.anim:update(dt)
end