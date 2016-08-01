
player = { }

function player.load()

	-- load model
	player.model = love.graphics.newImage("resources/player.png")
	player.isjump = false
	-- physical character
	player.body = love.physics.newBody(game.world, 200, 200, "dynamic") -- started coordinate
	player.shape = love.physics.newRectangleShape(player.model:getWidth()-100, player.model:getHeight()-20)
	player.fixture = love.physics.newFixture(player.body, player.shape, 0)
	player.fixture:setUserData("player")
	--
end

function player.jump()
	if not player.isjump then			
		player.isjump = true
		local x = player.body:getLinearVelocity()
		player.body:setLinearVelocity(x, -800)

			-- player.body:applyLinearImpulse(0,-20)

			-- player.body:applyForce(0,-1000)
	end
end

function player.moveLeft()
	player.body:applyForce(-1000, 0)
end

function player.moveRight()
	player.body:applyForce(1000, 0)	
end

function player.update(dt)



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

	
	
	--love.graphics.polygon("fill",player.body:getWorldPoints(player.shape:getPoints()))
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(player.model, player.body:getX() - player.model:getWidth() / 2,
	player.body:getY() - player.model:getHeight() / 2)

end

function player.destroy()

end