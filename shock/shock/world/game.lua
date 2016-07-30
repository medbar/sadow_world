-- ОСНОВНОЙ КЛАСС ДЛЯ ИГРОВОГО ПРОЦЕССА 



require "player/player"

require "world/level"


  
game = {}

function game.load()
		-- load physics
	love.physics.setMeter(128)
	game.world = love.physics.newWorld(0, 9.81 * 128, true)
	game.world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	--
	player.load()
	level.load("")

	return game
end

function game.update(dt)
	game.world:update(dt)
	player.update(dt)
	level.update(dt)
end

function game.draw()
	love.graphics.translate(options.resolution.w / 2 - player.body:getX(),
							 options.resolution.h / 2 - player.body:getY())
	level.draw()
	player.draw()
end


function game.destroy()
	game.world:destroy()
	level.destroy()
	player.destroy()
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







-------------------------------- game actions -----------------------------------

function PAUSE()
	IN_PROCESS = menu.load("pause_menu")
end

function LOSE()
	IN_PROCESS = menu.load("lose_menu")
end


function WIN()
	IN_PROCESS = menu.load("win_menu")
end