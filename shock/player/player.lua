
player = { }

function player.load()

	-- load model
	player.model = love.graphics.newImage("resources/player.png")
	player.jump = false
	-- physical character
	player.body = love.physics.newBody(game.world, 200, 200, "dynamic") -- started coordinate
	player.shape = love.physics.newRectangleShape(player.model:getWidth()-100, player.model:getHeight()-20)
	-- player.shape =  love.physics.newRectangleShape(100,200)
	player.fixture = love.physics.newFixture(player.body, player.shape, 0)
	player.fixture:setUserData("player")
	--
end


function player.update(dt)


	if love.keyboard.isDown(options.controls.right) then
		player.body:applyForce(1000, 0)
	end
	if love.keyboard.isDown(options.controls.left) then
		player.body:applyForce(-1000, 0)
	end

	if love.keyboard.isDown(options.controls.jump) then
		if not player.jump then
			player.jump = true
			local x = player.body:getLinearVelocity()
			player.body:setLinearVelocity(x, -800)

			-- player.body:applyLinearImpulse(0,-20)

			-- player.body:applyForce(0,-1000)
		end
	end
	if love.keyboard.isDown(options.controls.pause) then
		PAUSE()
		--
		--
		-- остановочка вышла 
	
		--
		--	
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