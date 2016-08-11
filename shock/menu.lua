-- ОСНОВНОЙ КЛАСС ДЛЯ НЕИГОВОГО ПРОЦЕССА
--
require "audio/playSounds"
require "menu/actions"


MAIN_FONT = "aMavickFont.ttf"
FONT_FOR_BOTTON = 20

MENU_SCRIPTS_PATH = "menu/"
MENU_MUSIC_PATH = "audio/menu/menu_sound.mp3"
MENU_SELECTION_CLICK = "audio/menu/menu_selection_click.wav"
menu = {
	history = { },
	previous = function()
		menu.history[#menu.history] = nil
		local answ = menu.history[#menu.history]
		menu.history[#menu.history] = nil
		return answ
	end
}

function menu.load(menu_type)

	--menu.oldKeypressed = love.keypressed
	--love.keypressed = menu.keypressed


	love.mouse.setVisible( true )
	table.insert(menu.history, menu_type)
	menu.elements = { }
	menu.textures = { }
	menu.background = love.graphics.newImage("graphics/menu/bg_" .. menu_type .. ".png")
  menu.soundBG = MENU_MUSIC_PATH

	playSoundBG(menu.soundBG, menu_type)

	menu.elements = require(MENU_SCRIPTS_PATH .. menu_type)

	for i, obj in ipairs(menu.elements) do
		local font = love.graphics.newFont(MAIN_FONT, obj.fontSize)
		obj.TEXT = love.graphics.newText(font, obj.text)
	end

	INIT_COLLECTION(menu, "elements")

	menu.focus = 0
	-- botton in focus index

	return menu
end


function menu.update(dt)
	-- options.resolution.w =  650
	-- fWINDOW_HEIGHT = ff
	local mX = love.mouse.getX()
	local mY = love.mouse.getY()
	menu.oldfocus = menu.focus
	menu.focus = 0

	for i, b in ipairs(menu.elements) do
		if not b.disableFocus then
			if math.abs(mX - b.x * options.resolution.w) < menu.textures[b.texture_name]:getWidth() and
				math.abs(mY - b.y * options.resolution.h) < menu.textures[b.texture_name]:getHeight()
			then
				menu.focus = i
				if menu.focus ~= menu.oldfocus then 

					playSound(MENU_SELECTION_CLICK ,"static")
				end

				break
			end
		end
	end
end


function menu.keyreleased(key)
	if key == "escape" and menu.elements.escape ~= nil then
		if 	not menu.escRepeat then 
			menu.focus = menu.elements.escape
			menu.elements[menu.focus]:action()
		else
				menu.escRepeat = nil
		end
	end
end


function menu.draw()
	-- draw background
	love.graphics.setColor(255, 255, 255)

	love.graphics.draw(menu.background, 0, 0, 0,
	options.resolution.w / menu.background:getWidth(),
	options.resolution.h / menu.background:getHeight())

	-- draw elements
	for i, b in ipairs(menu.elements) do
		-- graphic
		if i == menu.focus then
			love.graphics.setColor(120, 120, 120)
		else
			love.graphics.setColor(255, 255, 255)
		end

		b:draw(menu.textures)
		--
		-- text
		love.graphics.setColor(200, 20, 100)
		if b.drawText then
			b:drawText()
		else
			love.graphics.draw(b.TEXT, b.x * options.resolution.w - b.TEXT:getWidth() / 2,
			b.y * options.resolution.h - b.TEXT:getHeight() / 2)
		end
		--

	end

	--

end


function menu.drawText()

end


function menu.mousepressed(x, y, botton)
	if menu.focus ~= 0 then
		if menu.elements[menu.focus].mousepressed then
			menu.elements[menu.focus]:mousepressed(x - menu.elements[menu.focus].x * options.resolution.w + menu.textures[menu.elements[menu.focus].texture_name]:getWidth() / 2,
			y - menu.elements[menu.focus].y * options.resolution.h + menu.textures[menu.elements[menu.focus].texture_name]:getHeight() / 2)
		end
	end
end


function menu.mousereleased(x, y, botton)
	if menu.focus ~= 0 then
		menu.elements[menu.focus]:action()

	end
end


function menu.destroy()
	--love.keypressed = menu.oldKeypressed
	menu.escRepeat = nil 
	menu.history = { }
	menu.elements = nil
	menu.textures = nil
	menu.background = nil
	love.audio.stop()
end