local circleX = 0
local circleY = 0

function love.draw()
   love.graphics.circle("fill", 0, 0, 100)
end

function love.keypressed(key)
   if key == "tab" then
      love.window.getFullscreen()
   end
   if key == "up" then
   end
end