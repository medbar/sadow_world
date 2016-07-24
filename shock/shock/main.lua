-- game state :
-- main_menu
-- win_menu
-- lose_menu
-- game
-- option
-- pause


WINDOW_WIDTH = 650
WINDOW_HEIGHT = 650


require "Animation"
require "world/game"
require "menu"


function love.load()

	

	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
	GAME_STATE = "main_menu"
	menu.load("main_menu")
end


function love.mousereleased(x, y, button, istouch)
	if GAME_STATE ~= "game" then
		menu.mousereleased(x, y, button)
	end
end


function love.update(dt)

	if GAME_STATE == "main_menu" or GAME_STATE == "pause" then
		menu.update()

	elseif GAME_STATE == "game" then
		game.update(dt)
	
	end

end



function love.draw()
	

	if GAME_STATE == "main_menu" or GAME_STATE == "pause" then
		menu.draw()

	elseif GAME_STATE == "game" then
		game.draw()
	
	end

end






function CHANGE_STATE(action)


	if action == "new game" then
		GAME_STATE = "game"
		game.load()
		-- location.load()


	elseif action == "option" then
		menu.load("option_menu")
		GAME_STATE = "option"

	elseif action == "exit" then
		GAME_STATE = "exit"

	elseif action == "lose" then
		menu.load("lose_menu")
		GAME_STATE = "lose_menu"

	elseif action == "win" then
		menu.load("win_menu")
		GAME_STATE = "win_menu"
	
	elseif action == "pause" then
		menu.load("pause_menu")
		GAME_STATE = "pause"

	elseif action == "main menu" then
		game.destroy()
		menu.load("main_menu")
		GAME_STATE = "main_menu"

	elseif action == "continue" then	
		GAME_STATE = "game"


	end
end