--  x, y  - координаты центра кнопки( ось y направленна вниз). Принимают значения от 0 до 1 
-- texture_name - имя файла-текстуры для кнопки
-- action - действие, которое совершается при нажатии на кнопку. Определяет метод, выполняющийся при нажатии
-- щирина и высота кнопки определяется из картинки

return {
	{
		x = 0.5, y = 0.35,
		texture_name = "graphics/menu/botton.bmp",
		text = "continue", fontSize = FONT_FOR_BOTTON,
		action = CONTINUE 
	},
	--
	{
		x = 0.5, y = 0.50,
		texture_name = "graphics/menu/botton.bmp", 
		text = "new game", fontSize = FONT_FOR_BOTTON, 
		action = NEW_GAME 
	},
	--
	{
		x = 0.5, y = 0.65, 
		texture_name = "graphics/menu/botton.bmp", 
		text = "option", fontSize = FONT_FOR_BOTTON, 
		action = GO_TO_OPTIONS 
	},
	-- 
	{
		x = 0.5, y = 0.8, 
		texture_name = "graphics/menu/botton.bmp", 
		text = "main menu", fontSize = FONT_FOR_BOTTON, 
		action = GO_TO_MAIN_MENU 
	},
		--

		-- сюды можно вписать новые кнопки по примерам
		
		}