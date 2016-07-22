-- game state :
-- main_menu
-- win_menu
-- lose_menu
-- game
-- option
-- pause


WINDOW_WIDTH = 650
WINDOW_HEIGHT = 650


require "world/game"
require "menu"

function love.load()

	-- load physics
	love.physics.setMeter(128)
	world = love.physics.newWorld(0, 9.81 * 128, true)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	--


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
		world:update(dt)
		player.update(dt)
	
	end

end



function love.draw()
	love.graphics.print(GAME_STATE, 10,10) -- DEBUG
	love.graphics.print(act, 10,30) -- DEBUG

	if GAME_STATE == "main_menu" or GAME_STATE == "pause" then
		menu.draw()

	elseif GAME_STATE == "game" then
		player.draw()
		ground.draw()
	elseif geme_state == "pause" then
		-- do something
	end
end



function beginContact(a, b, coll)
	if a:getUserData() == "player" or b:getUserData() == "player" then
		local x, y = coll:getNormal()
		if y > 0 then
			player.jump = false
		end
	end
end
 
 
function endContact(a, b, coll)

end
 

function preSolve(a, b, coll)

end
 
function postSolve(a, b, coll, normalimpulse, tangentimpulse)

end

act = "" -- DEBUG
function CHANGE_STATE(action)
	act = action -- DEBUG

	if action == "new game" then
		GAME_STATE = "game"
		player.load()
		ground.load()
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
		menu.load("main_menu")
		GAME_STATE = "main_menu"

	elseif action == "continue" then	
		GAME_STATE = "game"


	end
end