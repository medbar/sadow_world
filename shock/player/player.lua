
player = { }

function player.load()

	-- load model
	player.direction = -1 -- -1 - налево, 1 - направо
	player.scalePositionX =  0.5
	player.scalePositionY = 0.5
	player.model = require("player/model")
	player.textures = {}
	INIT_COLLECTION(player, "model")


	player.isjump = false
	-- physical character

	player.hitBoxWidth =  120
	player.hitBoxHeight = 110
	player.maxV = 500
	player.body = love.physics.newBody(game.world, 200, 200, "dynamic") -- started coordinate
	player.body:setSleepingAllowed( false )
	player.shape = love.physics.newRectangleShape(player.hitBoxWidth,player.hitBoxHeight)
	player.fixture = love.physics.newFixture(player.body, player.shape, 0)
	player.fixture:setUserData("player")
	player.fixture:setFriction(0.9)

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
	--player.isjump = true			
	player.body:setLinearVelocity(x, -800)
			-- player.body:applyLinearImpulse(0,-20)
			-- player.body:applyForce(0,-2000)
	--end
	end
end

function player.moveLeft()
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

function player.update(dt)

	-- ограничиваем скорость 
	

	if love.keyboard.isDown(options.controls.left) then
		player.moveLeft()
	end
	if love.keyboard.isDown(options.controls.right) then
		player.moveRight()
	end
	if love.keyboard.isDown(options.controls.jump) then
		player.jump()
	end
	if love.keyboard.isDown(options.controls.pause) then
		PAUSE()
	end
end


function player.draw()

	
	
	--love.graphics.polygon("fill",player.body:getWorldPoints(player.shape:getPoints())) --_DEBUG
	love.graphics.setColor(255, 255, 255)
	local pS = 1
	if player.isjump then

	elseif math.abs(player.body:getLinearVelocity()) <10 then
		pS = 1
	else 
		pS = 2
	end 

	player.model[pS].r = 0
	player.model[pS].sx = player.direction
	player.model[pS].sy = 1 
	if player.direction ==-1 then
		player.model[pS].ox = (player.textures[player.model[pS].texture_name]:getWidth()/player.model[pS].number_of_frames)
	else
		player.model[pS].ox = 0
	end

	player.model[pS].oy = 0
	player.model[pS]:draw(player.textures)

end

function player.destroy()

end