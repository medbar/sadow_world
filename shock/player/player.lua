
require "audio/playSounds"

GAME_GUN_SOUND = "audio/game/gun_sound.mp3"
GAME_RUN_SOUND = "audio/game/run_sound.wav"
GAME_JUMP_SOUND = "audio/game/jump_sound.mp3"

player = { }

function player.load()

	--игровые характеристики
	player.hp = 100
	player.attackspeed = 0.8 -- в секундах
	player.bulletSpeed = 1200
	player.damage = 10

	player.lastAttack = 0
	player.lastDamage = 0
	-- load model
	player.direction = -1 -- -1 - налево, 1 - направо
	player.scalePositionX =  0.5
	player.scalePositionY = 0.5
	player.model = require("player/model")
	player.textures = {}
	INIT_COLLECTION(player, "model")
	player.textures.bullet = love.graphics.newImage(player.model.bullet)

	player.isjump = false
	-- physical character

	player.hitBoxWidth =  100
	player.hitBoxHeight = 170
	player.maxV = 500
	player.body = love.physics.newBody(game.world, 200, 200, "dynamic") -- started coordinate
	player.body:setSleepingAllowed( false )
	player.shape = love.physics.newRectangleShape(player.hitBoxWidth,player.hitBoxHeight)
	player.fixture = love.physics.newFixture(player.body, player.shape, 0)
	player.fixture:setUserData(player)

	player.fixture:setGroupIndex(SHOCK_INDEX)

	--
end

function  player.getX()
	return player.body:getX()
end

function player.getY()
	return player.body:getY()
end

function player.jump()
	if (not player.isjump) then
	local x,y = player.body:getLinearVelocity() 	
	playRunSound(GAME_JUMP_SOUND, "static")

	player.body:setLinearVelocity(x, -800)
			-- player.body:applyLinearImpulse(0,-20)
			-- player.body:applyForce(0,-2000)
	--end
	end
end

function player.moveLeft()
	--player.runSound = playRunSound(GAME_RUN_SOUND, "static")
	local Vx, Vy = player.body:getLinearVelocity()
	player.direction = -1
	if  -Vx > player.maxV then 
		return 
	end

	local force = 2000
	if player.isjump then 
		if Vy > player.maxV then
			return
		end
		force = force/3
	end
	player.body:applyForce(-force, 0)
end

function player.moveRight()
	-- player.runSound = playRunSound(GAME_RUN_SOUND, "static")
	local Vx, Vy = player.body:getLinearVelocity()
	player.direction = 1
	if  Vx > player.maxV then 
		return 
	end

	local force = 2000
	if player.isjump then 
		if Vy > player.maxV then
			return
		end
		force = force/3
	end
	player.body:applyForce(force, 0)	
end

function  player.attack()
	if player.attackspeed < (love.timer.getTime() - player.lastAttack) then
		playRunSound(GAME_GUN_SOUND , "static")

		player.lastAttack = love.timer.getTime()
		game.newBullet(player.getX(), -- + player.hitBoxWidth/2*player.direction,
						 player.getY()+32,
						player.bulletSpeed, 0,
						player.textures.bullet, player.direction, player.damage,  SHOCK_INDEX)
	end
end

function player.update(dt)

	
	
	 player.pS = 1
	if 	(love.timer.getTime() - player.lastDamage) < (player.model[4].number_of_frames * player.model[4].frame_dt) then 
		player.pS = 5
	elseif player.isjump then
		player.pS = 3
	elseif math.abs(player.body:getLinearVelocity()) <10 then
		player.pS = 1
	else	
		player.pS = 2
	end 


	if player.pS ~= 5 then
		if love.keyboard.isDown(options.controls.left) then
			player.moveLeft()
   			
		end
		if love.keyboard.isDown(options.controls.right) then
			player.moveRight()
   	 		
		end
		if love.keyboard.isDown(options.controls.jump) then
			player.jump()
  		 	 --if player.runSound ~= nil then
		   	   --player.runSound:stop()
		   	 --end
 	  		
		end

		if  love.keyboard.isDown(options.controls.attack) then
			player.attack()
  	  	
		end


		if love.keyboard.isDown(options.controls.pause) then
			PAUSE()
		end
	end
end


function player.draw()

	
	
	--love.graphics.polygon("fill",player.body:getWorldPoints(player.shape:getPoints())) --_DEBUG
	love.graphics.setColor(255, 255, 255)
	player.model[player.pS].r = 0
	player.model[player.pS].sx = player.direction
	player.model[player.pS].sy = 1 
	if player.direction ==-1 then
		player.model[player.pS].ox = player.model[player.pS].frameWidth
	else
		player.model[player.pS].ox = 0
	end

	player.model[player.pS].oy = 0
	player.model[player.pS]:draw(player.textures,
									player.getX(),
									player.getY())

end

function player.destroy()

end


function player.die()
	LOSE()
end

function player.beginContact(a, b, coll)
	
end
 
 

 

function player.preSolve(curret, b, coll)
		local x, y = coll:getNormal()
		if y > 0 and coll:isEnabled() then
			player.isjump = false
		end
	
end
 
function player:takingDamage(dmg)
	player.lastDamage = love.timer.getTime()
	if player.pS ~= 5 then 
		player.hp = player.hp - dmg
		if player.hp <= 0 then 
			LOSE()
		end
		return true -- если пуля попала 
	end
	return false -- мы неуязвимы 
end