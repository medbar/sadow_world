--  x, y  - координаты центра кнопки( ось y направленна вниз). Принимают значения от 0 до 1 
-- texture_name - имя файла-текстуры для кнопки
-- action - действие, которое совершается при нажатии на кнопку.  Определяет метод, выполняющийся при нажатии
-- щирина и высота кнопки определяется из картинки

return {
		--
	{
		x = 0.3, y = 0.4 , 
		texture_name = "graphics/menu/botton.bmp", 
		text = "Графика", fontSize = FONT_FOR_BOTTON, 
		action = GO_TO_GRAPHICS 
	},
		--
	{	
		x = 0.5, y = 0.4 ,
		texture_name = "graphics/menu/botton.bmp", 
		text = "Звук", fontSize = FONT_FOR_BOTTON, 
		action = GO_TO_SOUNDS 
	},
		--
	{
		x = 0.7, y = 0.4 , 
		texture_name = "graphics/menu/botton.bmp", 
		text = "Управление", fontSize = FONT_FOR_BOTTON, 
		action = GO_TO_CONTROLS 
	},
		--
	{ 
		x = 0.5, y = 0.7 , 
		texture_name  = "graphics/menu/botton.bmp", 
		text = "Назад", fontSize = FONT_FOR_BOTTON, 
		action = GO_BACK
	},

	escape = 4, -- кнопка, забитая на escape
		--
		-- сюды можно вписать новые кнопки по примерам
		
		-- сюда можно вписать специализированные методы load, mouseMoved, mousePressed, mouseReleased, draw
		}





		--полностью класс с опциями
--		{ eType = "checkbox", x = 0.3, y = 0.1 , texture_name = "graphics/menu/checkbox.bmp",  text = "Fullscreen"  , action = SWITCH_FULLSCREEN },
--		-- 
--		{ eType = "slider", x = 0.3, y = 0.2 , texture_name = "graphics/menu/text_window.bmp", text = "sound", action = LOAD_GAME },
--		--
--		{ eType = "slider", x = 0.3, y = 0.3 , texture_name = "graphics/menu/text_window.bmp", text = "option", action = GO_TO_OPTIONS },
--		--
--		{ eType = "inputText", x = 0.3, y = 0.4 , texture_name = "graphics/menu/text_window.bmp", text = "exit", action = EXIT }
----optionMenu = {}

--function optionMenu.load()

--end

--function optionMenu.draw()

--end