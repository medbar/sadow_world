
player = { }

function player.load()

	-- load model
	player.model = love.graphics.newImage("resources/player.png")
	player.jump = false
	-- physical character
	player.body = love.physics.newBody(world, 650, 650 / 2, "dynamic")
	player.shape = love.physics.newRectangleShape(player.model:getWidth(), player.model:getHeight())
	-- player.shape =  love.physics.newRectangleShape(100,200)
	player.fixture = love.physics.newFixture(player.body, player.shape, 0)
	player.fixture:setUserData("player")
	--
end


function player.update(dt)
	-- do something


	if love.keyboard.isDown("right") then
		player.body:applyForce(1000, 0)
	end
	if love.keyboard.isDown("left") then
		player.body:applyForce(-1000, 0)
	end

	if love.keyboard.isDown("space") then
		if not player.jump then
			player.jump = true
			local x = player.body:getLinearVelocity()
			player.body:setLinearVelocity(x, -800)

			-- player.body:applyLinearImpulse(0,-20)

			-- player.body:applyForce(0,-1000)
		end
	end
	if love.keyboard.isDown("escape") then
		CHANGE_STATE("pause")
		--
		--
		-- остановочка вышла 
		-- TO  DO
		--сделать меню паузы, сделать нормальную загрузку скриптов меню!
		--
		--	
	end

end

function player.draw()

	love.graphics.translate(650 / 2 - player.body:getX(), 650 / 2 - player.body:getY())
	
	--love.graphics.polygon("fill",player.body:getWorldPoints(player.shape:getPoints()))
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(player.model, player.body:getX() - player.model:getWidth() / 2,
	player.body:getY() - player.model:getHeight() / 2)

end