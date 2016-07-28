--  x, y  - координаты центра кнопки( ось y направленна вниз). Принимают значения от 0 до 1 
-- texture_name - имя файла-текстуры для кнопки
-- action - действие, которое совершается при нажатии на кнопку. Определяет метод, выполняющийся при нажатии
-- щирина и высота кнопки определяется из картинки

return {{x = 0.5, y = 0.4 , texture_name = "graphics/menu/botton.bmp", text = "continue", action = CONTINUE },
		-- 
		{x = 0.5, y = 0.6 , texture_name = "graphics/menu/botton.bmp", text = "main menu", action = GO_TO_MAIN_MENU },
		--

		-- сюды можно вписать новые кнопки по примерам
		
		}