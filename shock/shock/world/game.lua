
require "player/player"

require "world/level"



-- TODO 
-----------СДЕЛАНО------------------------------------------------
--	загрузка определенного левела 
--	объекты дизайна
--	
--	Кроме объектов "земля" добавить объекты "тип активаторы"
-- также объекты с которыми можно взаимодействовать
-----------СДЕЛАНО-------------------------------------------------
--
--	Сделать гейм-диспетчер основной задачей которого
-- будет подгружать в level нужную локацию
--	 из level'a будут вызываться все функции объектов этого левела 
--	
--	Анимации
--
--
--
--И на засладку немного ИИ
--
--
--
  
game = {}

function game.load()
		-- load physics
	love.physics.setMeter(128)
	game.world = love.physics.newWorld(0, 9.81 * 128, true)
	game.world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	--
	player.load()
	level.load("")

end

function game.update(dt)
	game.world:update(dt)
	player.update(dt)
	level.update(dt)
end

function game.draw()
	love.graphics.translate(650 / 2 - player.body:getX(), 650 / 2 - player.body:getY())
	level.draw()
	player.draw()
end


function game.destroy()
	game.world:destroy()
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