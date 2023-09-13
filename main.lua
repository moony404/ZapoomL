-- game run with love2d 11.4 library and it's made in Lua
-- variables
player = {}
player.x = 0
player.y = 0
player.speed = 200
-- img variables
player.sprite = love.graphics.newImage('img/player.png')
background = love.graphics.newImage('img/background.png')
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
   if love.keyboard.isDown("right") then
      player.x = player.x + player.speed * dt
   end
   if love.keyboard.isDown("left") then
      player.x = player.x - player.speed * dt
   end
   if love.keyboard.isDown("down") then
      player.y = player.y + player.speed * dt
   end
   if love.keyboard.isDown("up") then
      player.y = player.y - player.speed * dt
   end
   -- shortcut for keyboard
   if love.keyboard.isDown("backspace") then
      love.window.close()
   end
   if love.keyboard.isDown("lctrl") then
      love.window.minimize()
   end
   -- close the app keybind
end