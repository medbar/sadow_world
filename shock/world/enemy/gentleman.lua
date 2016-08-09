
function GENTLEMAN() return {
	model = {
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

	},
	characteristics = {
		stepForce = 2000,
		hp = 100,
		bloodLust = 0,
		width = 100,
		height = 100,
		maxV = 200,
	},

	tergets = { 
		AVOID_DEATH_TARGET, 
		CATCH_UP_PLAYER_TARGET,
	},
	

	--jump = ENEMY_JUMP,
	step = SINGLE_ENEMY_STEP,
	stepLeft = ENEMY_LEFT,
	stepRight = ENEMY_RIGHT,
	takingDamage = ENEMY_TAKING_DAMAGE,
	die = ENEMY_DIE,
}

end