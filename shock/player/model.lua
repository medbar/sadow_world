
return {
			-- [1] - состояние покоя
			-- [2] - бег(в лево)
			-- [3] - прыжок 
			-- [4] - атака(обычная)
			-- [4 + №атаки] - атаки необычные
			
			--1
			{
				x = player.scalePositionX, 
				y = player.scalePositionY,
				texture_name = "graphics/game/main/GG.png",
				init = ANIMATED_OBJECT,
				number_of_frames = 2,
				frame_dt = 0.4,
			},
			--2
			{	
				x = player.scalePositionX, 
				y = player.scalePositionY, 
				init = ANIMATED_OBJECT,
				texture_name = "graphics/game/main/run.png",
				--    
				-- ПЕРЕМЕННЫЕ ДЛЯ АНИМАЦИИ								
				number_of_frames = 2,
				frame_dt  = 0.20,
				--
			}
			--3

			--4


}