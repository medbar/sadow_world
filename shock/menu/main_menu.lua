--все элементы наследуются от графических объектов и добавляют к ним ещё функционал active элементов 

--  x, y  - координаты центра кнопки( ось y направленна вниз). Принимают значения от 0 до 1 
-- texture_name - имя файла-текстуры для кнопки
-- action - действие, которое совершается при нажатии на кнопку.  Определяет метод, выполняющийся при нажатии
-- щирина и высота кнопки определяется из картинки

return {
	{
		x = 0.5, y = 0.3 ,
		texture_name = "graphics/menu/botton.bmp", 
		text = "Новая игра", fontSize = FONT_FOR_BOTTON, 
		action = NEW_GAME 
	},
		-- 
	{
		x = 0.5, y = 0.5 ,
		texture_name = "graphics/menu/botton.bmp", 
		text = "Загрузка", fontSize = FONT_FOR_BOTTON, 
		action = LOAD_GAME 
	},
		--
	{
		x = 0.5, y = 0.7 , 
		texture_name = "graphics/menu/botton.bmp", 
		text = "Настройки", fontSize = FONT_FOR_BOTTON, 
		action = GO_TO_OPTIONS 
	},
		--
	{	
		x = 0.5, y = 0.9 , 
		texture_name = "graphics/menu/botton.bmp", 
		text = "Выход", fontSize = FONT_FOR_BOTTON, 
		action = EXIT 
	}
		--
		-- сюды можно вписать новые кнопки по примерам
		
}