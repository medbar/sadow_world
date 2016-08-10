-- ОСНОВНОЙ КЛАСС ДЛЯ ИГРОВОГО ПРОЦЕССА 



require "player/player"

require "world/level"
require "world/dialogManager"
require "world/enemyManager"
  
game = {}

function game.load()
	game.random = love.math.newRandomGenerator()
	game.random:setSeed(os.time())
	game.state = "inLevel"
	love.mouse.setVisible( false )
		-- load physics
	love.physics.setMeter(128)
	game.world = love.physics.newWorld(0, 9.81 * 128, true)
	game.world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	--
	player.load()
	level.load("testLevel")



	game.bullets = {
	delete = function(bullet)
		bullet.fixture:destroy()
		bullet.body:destroy()
		for i,obj in ipairs(game.bullets) do
			if obj == bullet then
				table.remove(game.bullets,i)
				return
			end
		end
	end 
	}

	enemyManager.load("testLevel")


	return game
end



function game.newBullet(x, y, vx, vy, texture, direction, damage, groupID)
	local bullet = {
			texture = texture,
			body = love.physics.newBody(game.world,x,y,"dynamic"),
			shape = love.physics.newRectangleShape(texture:getDimensions()),
			beginContact = BULLET_CONTACT,
			direction = direction,
			damage = damage,
		}
		bullet.fixture  = love.physics.newFixture(bullet.body, bullet.shape)
		bullet.body:setBullet(true)
		bullet.body:setMass(30)
		bullet.body:setGravityScale(0)
		bullet.body:setLinearVelocity(vx*direction,vy)
		bullet.fixture:setUserData(bullet)
		--bullet.fixture:setSensor(true)
		bullet.fixture:setGroupIndex(groupID)
	table.insert(game.bullets,bullet)
end






function game.update(dt)
	player.isjump = true
	game.world:update(dt)
	if game.state == "inLevel" then
		player.update(dt)
		enemyManager.update()
		level.update(dt)
	elseif game.state == "dialog" then
		dialogManager.update()
	end


end

function game.draw()
	love.graphics.translate(options.resolution.w * player.scalePositionX - player.body:getX(),
							 options.resolution.h * player.scalePositionY - player.body:getY())
	level.draw()
	player.draw()
	enemyManager.draw()
	game.DRAW_BULLETS()
	if game.state == "dialog" then 
		dialogManager.draw()
	end

end



function game.DRAW_BULLETS()
	love.graphics.setColor(255,255,255)

	for i,obj in ipairs(game.bullets) do
		love.graphics.draw(obj.texture,
							obj.body:getX(), obj.body:getY(),
		 					0, obj.direction, 1)
	end

end

function game.destroy()
	game.world:destroy()
	
	level.destroy()
	player.destroy()
end


function beginContact(a, b, coll)
	if a:getUserData().beginContact ~=nil then
		a:getUserData().beginContact(a,b,coll)
	end
	if b:getUserData().beginContact ~=nil then
		b:getUserData().beginContact(b,a,coll)
	end
end
 
 
function endContact(a, b, coll)
	if a:getUserData().endContact ~=nil then
		a:getUserData().endContact(a,b,coll)
	end
	if b:getUserData().endContact ~=nil then
		b:getUserData().endContact(b,a,coll)
	end
end
 

function preSolve(a, b, coll)
	if a:getUserData().preSolve ~=nil then
		a:getUserData().preSolve(a,b,coll)
	end
	if b:getUserData().preSolve ~=nil then
		b:getUserData().preSolve(b,a,coll)
	end
	
end
 
function postSolve(a, b, coll, normalimpulse, tangentimpulse)

end







-------------------------------- game actions -----------------------------------

function PAUSE()
	IN_PROCESS = menu.load("pause_menu")
	menu.escRepeat = true 
end

function LOSE()
	IN_PROCESS = menu.load("lose_menu")
end


function WIN()
	IN_PROCESS = menu.load("win_menu")
end




function BULLET_CONTACT(a, b, coll)
	local target = b:getUserData()
	if b:isSensor() then
		return
	end
	if target.takingDamage ~= nil then
		if not target:takingDamage(a:getUserData().damage) then
			return
		end
	end
	game.bullets.delete(a:getUserData())
end


