-- ОСНОВНОЙ КЛАСС ДЛЯ ИГРОВОГО ПРОЦЕССА 



require "player/player"

require "world/level"


  
game = {}

function game.load()
	love.mouse.setVisible( false )
		-- load physics
	love.physics.setMeter(128)
	game.world = love.physics.newWorld(0, 9.81 * 128, true)
	game.world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	--
	player.load()
	level.load("testLevel")

	return game
end

function game.update(dt)
	player.isjump = true
	game.world:update(dt)
	player.update(dt)
	level.update(dt)
end

function game.draw()
	love.graphics.translate(options.resolution.w * player.scalePositionX - player.body:getX(),
							 options.resolution.h * player.scalePositionY - player.body:getY())
	level.draw()
	player.draw()
end


function game.destroy()
	game.world:destroy()
	level.destroy()
	player.destroy()
end


function beginContact(a, b, coll)
	-- if a:getUserData() == "player" or b:getUserData() == "player" then
	-- 	local x, y = coll:getNormal()
	-- 	if y > 0 then
	-- 		player.isjump = false
	-- 	end
	-- end
end
 
 
function endContact(a, b, coll)
	-- if a:getUserData() == "player" or b:getUserData() == "player" then
	-- 	local x, y = coll:getNormal()
	-- 	if y > 0 then
	-- 		player.isjump = false
	-- 	end
	-- end
end
 

function preSolve(a, b, coll)
	if a:getUserData() == "player" or b:getUserData() == "player" then
		local x, y = coll:getNormal()
		if y > 0 then
			player.isjump = false
		end
	end
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