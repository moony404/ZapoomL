-- game run with love2d 11.4 library and it's made in Lua
-- variables
function love.load()
   -- variables
   player = {}
   player.x = 0
   player.y = 0
   player.speed = 200
   -- img variables
   player.sprite = love.graphics.newImage('img/player.png')
   player.spriteSheet = love.graphics.newImage('img/player-sheet.png')
   background = love.graphics.newImage('img/background.png')
end
-- window settings
love.window.setMode(1920, 1080)
-- the draw funcion to draw the player and the background
function love.draw()
   love.graphics.draw(background)
   love.graphics.draw(player.sprite, player.x, player.y)
end
-- the main funcion
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