player = {}
player.x = 0
player.y = 0
player.speed = 300

love.window.setIcon(./src)

function love.draw()
   love.graphics.rectangle("fill", player.x, player.y, 100, 100)
end

function love.update(dt)
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
end