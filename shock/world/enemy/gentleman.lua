
function GENTLEMAN() return {
	model = {
			draw = DRAW_CLEVER_MODEL,
			-- [1] - состояние покоя
			-- [2] - бег(в лево)
			
			-- [3] - атака(обычная)
			-- [4] - защита сверху
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
			--4
			{
				texture_name = "graphics/game/enemies/gentleman_protected.png",
				init = IMAGE_OBJECT,
				number_of_frames = 1,
				frame_dt = 0.4,
			},


	},
	characteristics = {
		stepForce = 700,
		hp = 100,
		
		reactionTime = 0.2, --sec	
		bloodLust = 600,
		width = 110,
		height = 180,
		maxVx = 200,
	},

	tergets = { 
		CATCH_UP_PLAYER_TARGET,
		MELEE_ATTACK_TARGET,
		AVOID_DEATH_TARGET, 

		--STOP_TARGET,
		
	},
	

	--jump = ENEMY_JUMP,
	step = ENEMY_STOP,
	stepLeft = ENEMY_LEFT,
	stepRight = ENEMY_RIGHT,
	takingDamage = ENEMY_TAKING_DAMAGE,
	die = ENEMY_DIE,

	preSolve = THE_UMBRELLA,
	endContact = function(a,b,col)
					a:getUserData().wantAttack = nil
	end,

	attack = function(self)
		if self.wantAttack then
			if self.wantAttack == player then
				self.pS = 3
				--local vx, vy = self.phys.body:getLinearVelocity()
				player.body:setLinearVelocity(600*self.direction,-1000)
				player:takingDamage(10)

			end
		end	
	end,
}

end