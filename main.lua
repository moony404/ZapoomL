circle = {}
circle.x = 0
circle.y = 0
player = {}
player.x = 0
player.y = 0
player.speed = 100

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
end