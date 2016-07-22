--  x, y  - координаты центра кнопки( ось y направленна вниз). Принимают значения от 0 до 1 
-- texture_name - имя файла-текстуры для кнопки
-- action - действие, которое совершается при нажатии на кнопку
-- щирина и высота кнопки определяется из картинки

return {{x = 0.5, y = 0.3 , texture_name = "menu/botton.bmp", text = "new game", action = "new game" },
		-- 
		{x = 0.5, y = 0.5 , texture_name = "menu/botton.bmp", text = "load", action = "load game menu" },
		--
		{x = 0.5, y = 0.7 , texture_name = "menu/botton.bmp", text = "option", action = "option" },
		--
		{x = 0.5, y = 0.9 , texture_name = "menu/botton.bmp", text = "exit", action = "exit" }
		--
		-- сюды можно вписать новые кнопки по примерам
		
		}