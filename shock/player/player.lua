require "audio/playSounds"

GAME_GUN_SOUND = "audio/game/gun_sound.mp3"
GAME_RUN_SOUND = "audio/game/run_sound.wav"
GAME_JUMP_SOUND = "audio/game/jump_sound_1.mp3"

player = { }


function player.load()

	--игровые характеристики
	player.hp = 100
	player.attackspeed = 0.2 -- в секундах
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
	player.maxV = 600
	player.reactiveForce = 5000

	player.body = love.physics.newBody(game.world, 7000,2500, "dynamic") -- started coordinate
	player.body:setSleepingAllowed( false )
	--player.body:setMass(0)
	player.shape = love.physics.newRectangleShape(player.hitBoxWidth, player.hitBoxHeight)
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
	player.direction = -1
	player.step()	
end

function player.step()
	local Vx, Vy = player.body:getLinearVelocity()
	if player.direction*Vx > player.maxV then
			return
		end
	if player.isjump then 		
		player.body:applyForce(player.direction * player.reactiveForce/5, 0)
		return
	end
	
	player.body:applyForce(player.direction * player.reactiveForce, 0)
end

function player.moveRight()
	-- player.runSound = playRunSound(GAME_RUN_SOUND, "static")
	--local Vx, Vy = player.body:getLinearVelocity()
	player.direction = 1
	player.step()
end

function player.moveUp()
	--player.runSound = playRunSound(GAME_RUN_SOUND, "static")
	DEBUG_STATIC = player.onStairs
	if player.onStairs == nil then 
		return
	end
	if not player.onStairs  then
		player.onStairs = true 
		player.fixture:setSensor(true)
		player.body:setGravityScale(0)
		player.body:setLinearVelocity(0,0)
	end
	player.body:setLinearVelocity(0, -200)
end

function player.moveDown()
	--player.runSound = playRunSound(GAME_RUN_SOUND, "static")
	DEBUG_STATIC = player.onStairs
	if player.onStairs == nil then 
		return
	end
	if  not player.onStairs then 
		player.onStairs = true 
		player.fixture:setSensor(true)
		player.body:setLinearVelocity(0,0)
		player.body:setGravityScale(0)
	end
	player.body:setLinearVelocity(0, 200)
end

function  player.attack()
	if  player.pS < 4 then
		playRunSound(GAME_GUN_SOUND , "static")

		
		game.newBullet(player.getX() + player.hitBoxWidth/2 * (player.model[4].frameId-1), -- + player.hitBoxWidth/2*player.direction,
						 player.getY()+32 - 5 * (player.model[4].frameId-1),
						player.bulletSpeed, 0,
						player.textures.bullet, player.direction, player.damage,  SHOCK_INDEX)

		player.lastAttack = love.timer.getTime()
		player.pS = 4
		player.model[player.pS].frame_dt = player.attackspeed
	end
end


function player.update(dt)

	local time = love.timer.getTime()
	if (time - player.lastAttack) < player.attackspeed  then 
		player.pS = 4
	elseif ( time - player.lastDamage) < (player.model[4].number_of_frames * player.model[4].frame_dt) then
		player.pS = 5
	elseif player.onStairs then
		player.pS = 2 -- [6] 
		local x,y = player.body:getLinearVelocity()
		player.body:setLinearVelocity(x/1.1,0)
	
		
	elseif player.isjump then
		player.pS = 3
	elseif math.abs(player.body:getLinearVelocity()) <10 then
		player.pS = 1
	else	
		player.pS = 2 -- бег
	end 



	if  love.keyboard.isDown(options.controls.attack) then
		player.attack()
	end


	if love.keyboard.isDown(options.controls.pause) then
		PAUSE()
	end

	if player.pS ~=4 then

	if love.keyboard.isDown(options.controls.up) then
		player.moveUp()   			
	end
	if love.keyboard.isDown(options.controls.down) then
		player.moveDown()	
	end
	if love.keyboard.isDown(options.controls.left) then
		player.moveLeft()   			
	end
	if love.keyboard.isDown(options.controls.right) then
		player.moveRight()
   	 		
	end
	if love.keyboard.isDown(options.controls.jump) then
		player.jump()
	end

	end

	
	
 
end


function player.draw()

	if	player.model:draw(player.textures, player.pS, player.getX(), player.getY()) then 
		player.pS = 1
	end
	
	--love.graphics.polygon("fill",player.body:getWorldPoints(player.shape:getPoints())) --_DEBUG
	

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