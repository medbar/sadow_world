

dialogManager = {} 


function dialogManager.load(dialogTable, bgFile)
	--dialogTable - таблица, сделанная по строгим правилам диалочной таблицы
	
	dialogManager.oldKeypressed = love.keypressed
	love.keypressed = dialogManager.keypressed
	dialogManager.bg = love.graphics.newImage(bgFile) 

	dialogManager.table = dialogTable
	dialogManager.ID = 1
	dialogManager.font = love.graphics.newFont(MAIN_FONT, 18)
	dialogManager.text = love.graphics.newText(dialogManager.font,dialogManager.table[dialogManager.ID])
end


function dialogManager.update()
	
end

function dialogManager.keypressed(key,sc,isrepeat)
	if not isrepeat then 
	dialogManager.ID = dialogManager.ID + 1
		if dialogManager.table[dialogManager.ID] == nil or dialogManager.table[dialogManager.ID] == "end" then
			game.state = "inLevel"
			dialogManager.destroy()
			return
		end
		dialogManager.text:set(dialogManager.table[dialogManager.ID])
	end
end

function dialogManager.draw()
	love.graphics.push()
	love.graphics.origin()
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(dialogManager.bg,
						0, options.resolution.h*2/3,
						0,
						options.resolution.w / dialogManager.bg:getWidth(),
						options.resolution.h*2 / (3*dialogManager.bg:getHeight())
	)

	love.graphics.setColor(10, 12, 200)
	love.graphics.draw(dialogManager.text,
						options.resolution.w/2 - dialogManager.text:getWidth() / 2,
						options.resolution.h*5/6 - dialogManager.text:getHeight() / 2
						
	)

	love.graphics.pop()
end


function dialogManager.destroy()
	love.keypressed =	dialogManager.oldKeypressed
	dialogManager.bg  = nil
	dialogManager.text = nil
	dialogManager.font = nil
	dialogManager.table = nil
end