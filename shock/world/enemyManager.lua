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
	INIT_COLLECTION(enemy,"model")
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
		local Pwidth = (obj.textures[obj.model[1].texture_name]:getWidth()/obj.model[1].number_of_frames)
		obj.model[1]:draw(obj.textures, obj.phys.body:getX() - Pwidth/ 2,
										obj.phys.body:getY() - obj.textures[obj.model[1].texture_name]:getHeight() / 2 )

	end
end

function enemyManager.destroy()
	enemyManager.enemies = nil
end

function ENEMY_TAKING_DAMAGE(self, dmg)
	-- self.characteristics.hp = self.characteristics.hp - dmg
	-- if 	self.characteristics.hp <=0 then 
	-- 	self:die()
	-- end

	-- return true

end


function ENEMY_DIE(self)
	self.phys.fixture:destroy()
	self.phys.body:destroy()
	table.remove(enemyManager.enemies,self.ID)
end

function ENEMY_GET_X(self)
	return self.phys.body:getY()
end

function ENEMY_GET_Y(self)
	return self.phys.body:getY()
end