enemyManager = {}

require "world/enemy/gentleman" 
require "world/enemy/behavior"
require "world/enemy/gentleman"

function enemyManager.load(level_name)
	enemyManager.enemies = {}
 	local preE = require("levels/"..level_name.."/enemies")
	for i,obj in ipairs(preE) do
		enemyManager.newEnemy(obj)
	end
end



function enemyManager.newEnemy(args)

	enemy = args.mouseType()
	enemy.phys = {
		body = love.physics.newBody(game.world, args.x, args.y, "dynamic"),
		shape = love.physics.newRectangleShape(enemy.characteristics.width, 
												enemy.characteristics.height)
	}
	enemy.phys.fixture = love.physics.newFixture(enemy.phys.body, enemy.phys.shape)
	enemy.phys.fixture:setUserData(enemy)
	enemy.phys.body:setSleepingAllowed(false)
	enemy.textures = {}
	INIT_COLLECTION(enemy,model)
	--enemy.model[2].texture_name = "graphics/sample_texture.bmp"
	--enemy.textures["graphics/sample_texture.bmp"] = love.graphics.newImage(enemy.model[2].texture_name)
	--enemy.model[2]:init(enemy.textures)		
	--		

	table.insert(enemyManager.enemies, enemy)
	enemy.ID = #enemyManager.enemies
end

function enemyManager.update()

	for i, obj in ipairs(enemyManager.enemies) do
		for j,target in ipairs(obj.tergets) do 
			local d = game.random:random(1,100)
		 	local p, func = tagret(obj)
		 	if d < p*100 then 
		 		if not func(obj) then
		 			break
		 		end
		 	end 
		end
		obj:step()
	end

end 

function enemyManager.draw()
	for i,obj in ipairs(enemyManager.enemies) do 
		obj.model[2]:draw(obj.textures, obj.phys.body:getX(),obj.phys.body:getY())
	end
end

function enemyManager.destroy()
	enemyManager.enemies = nil
end

function ENEMY_TAKING_DAMAGE(self, dmg)
	self.characteristics.hp = sellf.characteristics.hp - dmg
	if 	sellf.characteristics.hp <=0 then 
		self:die()
	end
end


function ENEMY_DIE(self)
	bullet.fixture:destroy()
	bullet.body:destroy()
	table.remove(enemyManager.enemies,self.ID)
end

function ENEMY_GET_X(self)
	return self.phys.body:getY()
end

function ENEMY_GET_Y(self)
	return self.phys.body:getY()
end