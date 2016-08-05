
return {
			bullet =  "graphics/game/main/bullet.png",

			-- [1] - состояние покоя
			-- [2] - бег(в лево)
			-- [3] - прыжок 
			-- [4] - атака(обычная)
			-- [4 + №атаки] - атаки необычные
			
			--1
			{
				x = player.scalePositionX, 
				y = player.scalePositionY,
				texture_name = "graphics/game/main/shock_stay.png",
				init = IMAGE_OBJECT,
				number_of_frames = 1,
				frame_dt = 0.4,
			},
			--2
			{	
				x = player.scalePositionX, 
				y = player.scalePositionY, 
				init = ANIMATED_OBJECT,
				texture_name = "graphics/game/main/shock_run.png",
				--    
				-- ПЕРЕМЕННЫЕ ДЛЯ АНИМАЦИИ								
				number_of_frames = 4,
				frame_dt  = 0.10,
				--
			},
			--3
			{
				x = player.scalePositionX, 
				y = player.scalePositionY,
				texture_name = "graphics/game/main/jump.png",
				init = IMAGE_OBJECT,
				number_of_frames = 1,
				frame_dt = 0.4,
			},
			--4
			{
				x = player.scalePositionX, 
				y = player.scalePositionY,
				texture_name = "graphics/game/main/shock_stay.png",
				init = IMAGE_OBJECT,
				number_of_frames = 1,
				frame_dt = 0.4,
			},
			
}