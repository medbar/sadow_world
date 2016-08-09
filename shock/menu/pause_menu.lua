--  x, y  - координаты центра кнопки( ось y направленна вниз). Принимают значения от 0 до 1 
-- texture_name - имя файла-текстуры для кнопки
-- action - действие, которое совершается при нажатии на кнопку. Определяет метод, выполняющийся при нажатии
-- щирина и высота кнопки определяется из картинки

return {
	--[1]
	{
		x = 0.5, y = 0.35,
		texture_name = "graphics/menu/botton.bmp",
		text = "Продолжить", fontSize = FONT_FOR_BOTTON,
		action = CONTINUE 
	},
	--[2]
	{
		x = 0.5, y = 0.50,
		texture_name = "graphics/menu/botton.bmp", 
		text = "Новая игра", fontSize = FONT_FOR_BOTTON, 
		action = NEW_GAME 
	},
	--[3]
	{
		x = 0.5, y = 0.65, 
		texture_name = "graphics/menu/botton.bmp", 
		text = "Настройки", fontSize = FONT_FOR_BOTTON, 
		action = GO_TO_OPTIONS 
	},
	--[4] 
	{
		x = 0.5, y = 0.8, 
		texture_name = "graphics/menu/botton.bmp", 
		text = "Главное меню", fontSize = FONT_FOR_BOTTON-3, 
		action = GO_TO_MAIN_MENU 
	},
		--
	escape = 1, -- кнопка, забитая на escape
		-- сюды можно вписать новые кнопки по примерам
		
}