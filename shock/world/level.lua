﻿

-- GroupIndexs: 
GROUND_INDEX = 1 -- -1 - земля и землеподобные элементы
SHOCK_INDEX = -2 -- -2 - пули шока и сам шок
MOBS_INDEX = -3-- -3 - мобы


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

	enemyManager.load("levels/"..level_directory)

	level.frameCounter = 0 

end



function level.loadGround(level_directory)
	level.ground =  require(level.directory.."/ground")
	INIT_COLLECTION(level,"ground")
	for i,b in ipairs(level.ground) do 
		INIT_PHYSICS(b, "static", GROUND_INDEX)
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
		INIT_PHYSICS(obj, obj.object_type, 0, true )
	end
end
function level.loadDialogs()
	level.dialogs = require(level.directory.."/dialogs")
		
end

function level.loadMobs(level_directory)
	-- body
end



function level.update(dt)
end


function level.draw()
	love.graphics.setColor(255, 255, 255)
	level.DRAW_BG()
		
	level.DRAW_DECOR()
	level.DRAW_GROUND()

	level.DRAW_ACTVE()
	
end


function level.DRAW_BG()
	love.graphics.draw(level.bg.texture, 
						player.getX()/5-options.resolution.w/2,
						player.getY()/10-options.resolution.h/2,
						0,
						level.bg.width / level.bg.texture:getWidth(),
						level.bg.height / level.bg.texture:getHeight()
						,600, 600
						)
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
		block.draw(block,level.textures)
	end
end

function level.DRAW_ACTVE()
	love.graphics.setColor(255,255,255)
	for i,obj in ipairs(level.activeObjects) do
		obj:draw(level.textures)
	end
end 




function level.destroy()
	dialogManager.destroy()

end

function GO_TO_DIALOG(ID)
	game.state = "dialog"
	dialogManager.load(level.dialogs[ID], level.dialogs.background)
end