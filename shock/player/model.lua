
return {
			bullet =  "graphics/game/main/bullet.png",

			draw = DRAW_CLEVER_MODEL,
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
				
				texture_name = "graphics/game/main/shock_attack.png",
				init = ANIMATED_OBJECT,
				number_of_frames = 2,
				frame_dt = 0.2,
			},
			--5
			{
				
				texture_name = "graphics/game/main/shock_damage.png",
				init = function(self,textures)
					self.frameWidth = textures[self.texture_name]:getWidth() 
				end,
				
				draw = function(self, textures,x,y)
					love.graphics.setColor(80*game.random:random(10,40),
											0,0,220)
					DRAW_IMAGE_OBJECT(self,textures,x,y)	
				end,

				number_of_frames = 1,
				frame_dt = 0.1,
			},
			
}