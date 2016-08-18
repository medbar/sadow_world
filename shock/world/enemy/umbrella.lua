function UMBRELLA() return {
	model = {
			-- [1] - состояние покоя
			-- [2] - бег(в лево)
			-- [3] - прыжок 
			-- [4] - атака(обычная)
			-- [5] - получение урона
			-- [5 + №атаки] - атаки необычные
			
			--1
			{
				texture_name = "graphics/game/enemies/gentleman.png",
				init = IMAGE_OBJECT,
				number_of_frames = 1,
				frame_dt = 0.4,
			},
			--2
			{	
				init = ANIMATED_OBJECT,
				texture_name = "graphics/game/enemies/gentleman_run.png",
				--    
				-- ПЕРЕМЕННЫЕ ДЛЯ АНИМАЦИИ								
				number_of_frames = 4,
				frame_dt  = 0.10,
				--
			},
			--3
			{	
				init = ANIMATED_OBJECT,
				texture_name = "graphics/game/enemies/gentleman_attack.png",
				--    
				-- ПЕРЕМЕННЫЕ ДЛЯ АНИМАЦИИ								
				number_of_frames = 5,
				frame_dt  = 0.12,
				--
			},

	},
	characteristics = {
		stepForce = 700,
		hp = 100,
			
		bloodLust = 600,
		width = 110,
		height = 180,
		maxVx = 200,
	},

	tergets = { 
		AVOID_DEATH_TARGET, 

		CATCH_UP_PLAYER_TARGET,
		STOP_TARGET,
		
	},
	

	--jump = ENEMY_JUMP,
	step = ENEMY_STOP,
	stepLeft = ENEMY_LEFT,
	stepRight = ENEMY_RIGHT,
	takingDamage = ENEMY_TAKING_DAMAGE,
	die = ENEMY_DIE,

	preSolve = JUMP_ON_THE_UMBRELLA
}

end