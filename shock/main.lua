-- game state :
-- main_menu
-- win_menu
-- lose_menu
-- game
-- option
-- pause

--debug = true


require "my_debug"
require "options"
require "Animation"
require "world/game"
require "menu"


function love.load()
	options.load()  -- ченить придумать с хранением настроек 
	love.window.setMode(options.resolution.w, options.resolution.h,options.graphics)

	IN_PROCESS = menu.load("main_menu")
end

-- function love.keypressed(key,s, isre) 
-- if IN_PROCESS.keypressed then 
-- 		IN_PROCESS.keypressed(key,s,isre)
-- 	end
-- end

function love.keyreleased(key) 
  if IN_PROCESS.keyreleased then 
    IN_PROCESS.keyreleased(key)
  end
end


function love.mousepressed(x,y, botton) 
  if IN_PROCESS.mousepressed then 
		IN_PROCESS.mousepressed(x, y, botton)
	end
end


function love.mousereleased(x, y, botton)
	if IN_PROCESS.mousereleased then 
		IN_PROCESS.mousereleased(x, y, botton)
	end
end


function love.resize( w, h )
	options.resolution.w = w
	options.resolution.h = h
end


function love.update(dt)
	IN_PROCESS.update(dt)

	DEBUG_UPDATE() 
end


function love.draw()
	IN_PROCESS.draw()

	DEBUG_DRAW()
end
