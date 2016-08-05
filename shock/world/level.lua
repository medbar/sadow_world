



level = {}

function level.load(level_directory)

	level.textures = {}

	level.directory = "levels/"..level_directory

	level.bg = require(level.directory.."/background")
	level.bg.texture = love.graphics.newImage(level.bg.texture_name)

	level.loadGround(level_directory)

	level.loadDecor(level_directory)

	level.loadActiveObj(level_directory)

	level.loadDialogs(level_directory)

	level.loadMobs(level_directory)

	level.bullets = {
	delete = function(bullet)
		bullet.fixture:destroy()
		bullet.body:destroy()
		for i,obj in ipairs(level.bullets) do
			if obj == bullet then
				table.remove(level.bullets,i)
				return
			end
		end
	end 
	}

	level.frameCounter = 0 

end



function level.loadGround(level_directory)
	level.ground =  require(level.directory.."/ground")
	INIT_COLLECTION(level,"ground")
	for i,b in ipairs(level.ground) do 
		b.body = love.physics.newBody(game.world, b.x, b.y, "static")

		local v ={}
		for j, point in ipairs(b.vertices) do
			table.insert(v, point[1])
			table.insert(v, point[2])
		end
		b.shape = love.physics.newPolygonShape(v)	
		b.fixture = love.physics.newFixture(b.body, b.shape)
		b.fixture:setUserData(b)
	end
end

function level.loadDecor(level_directory)
	level.decor = require(level.directory.."/decor")
	INIT_COLLECTION(level, "decor")
end

function level.loadActiveObj(level_directory)
	level.activeObjects = require(level.directory.."/active_objects")
	INIT_COLLECTION(level, "activeObjects")
	for i,obj in ipairs(level.activeObjects) do
		obj.body = love.physics.newBody(game.world,obj.x,obj.y,obj.object_type)
		obj.shape = love.physics.newRectangleShape(obj.width, obj.height)
		obj.fixture = love.physics.newFixture(obj.body, obj.shape)
		obj.fixture:setSensor(true)
		obj.fixture:setUserData(obj)

	end
end
function level.loadDialogs()
	level.dialogs = require(level.directory.."/dialogs")
		
end

function level.loadMobs(level_directory)
	-- body
end

function level.newBullet(x, y, vx, vy, texture, direction, damage)
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
	table.insert(level.bullets,bullet)
end

function level.update(dt)
end


function level.draw()
	love.graphics.setColor(255, 255, 255)
	level.DRAW_BG()
	
	level.DRAW_GROUND()

	level.DRAW_DECOR()
	level.DRAW_ACTVE()
	level.DRAW_BULLETS()
	
end

function level.DRAW_BG()
	love.graphics.draw(level.bg.texture, 
						player.getX()/2-options.resolution.w/2,
						player.getY()/2-options.resolution.h/2,
						0,
						level.bg.width / level.bg.texture:getWidth(),
						level.bg.height / level.bg.texture:getHeight())
end

function level.DRAW_DECOR()

	love.graphics.setColor(255,255,255)
	for i,obj in ipairs(level.decor) do
		obj:draw(level.textures)
	end
end


function level.DRAW_GROUND()
	love.graphics.setColor(255,255,255)
	for i,block in ipairs(level.ground) do
		block.draw(block,textures)
	end
end

function level.DRAW_ACTVE()
	love.graphics.setColor(255,255,255)
	for i,obj in ipairs(level.activeObjects) do
		obj:draw(level.textures)
	end
end 

function level.DRAW_BULLETS()
	love.graphics.setColor(255,255,255)

	for i,obj in ipairs(level.bullets) do
		love.graphics.draw(obj.texture,
							obj.body:getX(), obj.body:getY(),
		 					0, obj.direction, 1)
	end

end


function level.destroy()
end

function GO_TO_DIALOG(ID)
	game.state = "dialog"
	dialogManager.load(level.dialogs[ID], level.dialogs.background)
end