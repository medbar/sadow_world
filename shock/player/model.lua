
return {
			bullet =  "graphics/game/main/bullet.png",

			-- [1] - состояние покоя
			-- [2] - бег(в лево)
			-- [3] - прыжок 
			-- [4] - атака(обычная)
			-- [5] - получение урона
			-- [5 + №атаки] - атаки необычные
			
			--1
			{

				texture_name = "graphics/game/main/shock_stay.png",
				init = IMAGE_OBJECT,
				number_of_frames = 1,
				frame_dt = 0.4,
			},
			--2
			{	
				
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
				
				texture_name = "graphics/game/main/jump.png",
				init = IMAGE_OBJECT,
				number_of_frames = 1,
				frame_dt = 0.4,
			},
			--4
			{
				
				texture_name = "graphics/game/main/shock_stay.png",
				init = IMAGE_OBJECT,
				number_of_frames = 1,
				frame_dt = 0.4,
			},
			--5
			{
				
				texture_name = "graphics/game/main/shock_damage.png",
				init = function()end,
				draw = function(self, textures)
					love.graphics.setColor(80*game.random:random(10,40),
											0,0,220)
					SCALE_DRAW_IMAGE_OBJECT(self,textures)	
				end,

				number_of_frames = 1,
				frame_dt = 0.1,
			},
			
}