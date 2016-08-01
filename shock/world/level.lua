



level = {}

function level.load(level_directory)

	level.textures = {}

	level.directory = "levels/"..level_directory

	level.background = require(level.directory.."background")

	local ground =  require(level.directory.."ground")
	level.ground = {}
	for i,b in ipairs(ground) do 
	table.insert(level.ground,{
								body = love.physics.newBody(game.world, b.x, b.y, "static"),
								shape = love.physics.newRectangleShape(b.w, b.h)	
								}
				)
		love.physics.newFixture(level.ground[#level.ground].body,
								level.ground[#level.ground].shape)
	end

	level.decor = require(level.directory.."decor")
	INIT_COLLECTION(level, "decor")

	level.active_objects = require(level.directory.."active_objects")
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
	love.graphics.setColor(20,50,20)
	for i,block in ipairs(level.ground) do
		love.graphics.polygon("fill",block.body:getWorldPoints(block.shape:getPoints()))
	end
end



function level.destroy()
end