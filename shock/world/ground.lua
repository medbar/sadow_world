
ground = {}

function ground.load()
	
	--load physics characters
	--
	ground[1]={}
	ground[1].body = love.physics.newBody(world,650,650-50/2,"static")
	ground[1].shape = love.physics.newRectangleShape(1300,50)
	ground[1].fixture = love.physics.newFixture(ground[1].body,ground[1].shape)
	ground[1].fixture:setUserData("ground")
	--
	ground[2]={}
	ground[2].body = love.physics.newBody(world,1300-50/2,650/2,"static")
	ground[2].shape = love.physics.newRectangleShape(50,650)
	ground[2].fixture = love.physics.newFixture(ground[2].body,ground[2].shape)
	ground[2].fixture:setUserData("ground")
	--
	ground[3]={}
	ground[3].body = love.physics.newBody(world,650,50/2,"static")
	ground[3].shape = love.physics.newRectangleShape(1300,50)
	ground[3].fixture = love.physics.newFixture(ground[3].body,ground[3].shape)
	ground[3].fixture:setUserData("ground")
	--
	ground[4]={}
	ground[4].body = love.physics.newBody(world,50/2,650/2,"static")
	ground[4].shape = love.physics.newRectangleShape(50,650)
	ground[4].fixture = love.physics.newFixture(ground[4].body,ground[4].shape)
	ground[4].fixture:setUserData("ground")
	--
end



function ground.draw()
	love.graphics.setColor(20,50,20)
	for i,block in ipairs(ground) do
		love.graphics.polygon("fill",block.body:getWorldPoints(block.shape:getPoints()))
	end
end