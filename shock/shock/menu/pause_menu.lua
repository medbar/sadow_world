--  x, y  - координаты центра кнопки( ось y направленна вниз). Принимают значения от 0 до 1 
-- texture_name - имя файла-текстуры для кнопки
-- action - действие, которое совершается при нажатии на кнопку
-- щирина и высота кнопки определяется из картинки

return {{x = 0.5, y = 0.4 , texture_name = "menu/botton.bmp", text = "continue", action = "continue" },
		-- 
		{x = 0.5, y = 0.6 , texture_name = "menu/botton.bmp", text = "main menu", action = "main menu" },
		--

		-- сюды можно вписать новые кнопки по примерам
		
		}