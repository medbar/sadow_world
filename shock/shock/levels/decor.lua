
--init - определяет способ загрузки и способ отрисовки объекта 
--init может быть:
--					POLYGON - объект, рисуемы с помошью функции love.graphics.polygon. Обязательные поля - mode = ("fill" or "line")
																										--color = { r, g, b ,a},
																										--vertices =  {x1,y1,x2,y2,...} 
--					IMAGE_OBJECT	- объект, загружающийся из картинки.  
--					ANIMATED_OBJECT	- анимированный объект, грузится из атласа.   
--					FROM_ATLAS	-   объект, загружающийся из атласа. Обязательные поля - WrapMode = ("repeat" or "clamp" or "clampzero" or morroredrepeat),
--																						 width, height, xInPic, yInPic
--
--  для анимации обязательны : tFile, number_of_frames, frame_dt 
--  tFile - атлас текстур кадров, кадры расположенны друг за другом вдоль оси х
-- number_of_frames - количество кадров
-- длина картинки = (кол-во кадров) * ширина 1 кадра
-- frame_dt - интервал(в екундах) между сменами кадров анимации


return {
		
		-- анимированное солнце( на фоне)
			{	
				-- ОБЯЗАТЕЛЬНЫЕ ПЕРЕМЕННЫЕ 
				init = ANIMATED_OBJECT,
				x = 500,
				y = 70,	
				tFile = "graphics/sun.png",
				--    
				-- ПЕРЕМЕННЫЕ ДЛЯ АНИМАЦИИ								
				number_of_frames = 6,
				frame_dt  = 0.05,
				--
			}
		

}