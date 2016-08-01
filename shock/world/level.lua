



level = {}

function level.load(level_directory)

	level.textures = {}

	level.directory = "levels/"..level_directory

	level.background = require(level.directory.."/background")

	level.ground =  require(level.directory.."/ground")
	INIT_COLLECTION(level,"ground")
	for i,b in ipairs(level.ground) do 
		b.body = love.physics.newBody(game.world, b.x, b.y, "static")

		local v ={}
		for j, point in ipairs(b.vertices) do
			table.insert(v, point[1])
			table.insert(v, point[2])
		end
		b.shape = love.physics.newPolygonShape(v) -- косяк	
		love.physics.newFixture(b.body, b.shape)
	end

	level.decor = require(level.directory.."/decor")
	INIT_COLLECTION(level, "decor")

	level.active_objects = require(level.directory.."/active_objects")
	--level.nps = require(love.directory.."nps")
	--


	level.frameCounter = 0 

end



function level.update(dt)
end


function level.draw()
	
	
	level.DRAW_GROUND()

	level.DRAW_DECOR()
	
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



function level.destroy()
end