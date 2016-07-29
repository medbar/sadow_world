-- game state :
-- main_menu
-- win_menu
-- lose_menu
-- game
-- option
-- pause



require "my_debug"
require "options"
require "Animation"
require "world/game"
require "menu"

function love.load()
	
	options.load()  -- ченить придумать с хранением настроек 
	love.window.setMode(options.resolution.x, options.resolution.y,options.graphics)
		
	IN_PROCESS = menu.load("main_menu")
end


function love.mousereleased(x, y, button, istouch)
	if IN_PROCESS.mousereleased then 
		menu.mousereleased(x, y, button)
	end
end




function love.resize( w, h )
	options.resolution.x = w
	options.resolution.y = h
end




function love.update(dt)
	
	IN_PROCESS.update(dt)

	DEBUG_UPDATE() 
end



function love.draw()
	

	IN_PROCESS.draw()

	DEBUG_DRAW()
end



