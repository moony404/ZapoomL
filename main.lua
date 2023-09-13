player = {}
player.x = 0
player.y = 0
player.speed = 200
player.sprite = love.graphics.newImage('img/player.png')

background = love.graphics.newImage('img/background.png')

love.window.setMode(1920, 1080)

function love.draw()
   love.graphics.draw(player.sprite, player.x, player.y)
   love.graphics.draw(background)
end

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
   -- close the app keybind
end