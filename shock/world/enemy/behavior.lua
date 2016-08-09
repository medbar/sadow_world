
-- функции поведения мышей




--ФУНКЦИИ-ЦЕЛИ мышей, возвращают вероятность действия и функцию-дейстиве




function CATCH_UP_PLAYER_TARGET(self)
	self.dx = math.abs(ENEMY_GET_X(self) - player.getX())
	self.dy = math.abs(ENEMY_GET_Y(self) - player.getY())

	return 1/(self.dx+self.dy+self.bloodLust) , CATCH_UP_PLAYER
end   





function AVOID_DEATH_TARGET(self)
	--будущее положение
	local vx,vy = self.phys:getLinearVelocity()
	self.futureX = vx + ENEMY_GET_X(self)
	self.futureX = vy + ENEMY_GET_Y(self)
	
	-- проверяем, нету ли впереди стенки, а то страшно, вдруг стенка, тогда вообще гг
	have_block = false
	game.world:rayCast( ENEMY_GET_X(self), ENEMY_GET_Y(self),
	 					vx*2 , vy*2 , SAMPLE_INSPECTION )
	if have_block then
		--есть
		return 0.9, CHANGE_DIRECTION
	end

	have_block = false
	game.world:rayCast(ENEMY_GET_X(self)+vx*2, ENEMY_GET_Y(self),
						ENEMY_GET_X(self)+vx*2,ENEMY_GET_Y(self) + 400,
						SAMPLE_INSPECTION)

	if have_block then
		--нету блока --> туда нельзя, а то упаду ещё
		return 0.99, CHANGE_DIRECTION
	end

	return 0,DO_NOTHING 

end



-- callback's для всяких проверок

function SAMPLE_INSPECTION(fixture, x, y, xn, yn, fraction)
if fixture:isSensor() then
	return -1
elseif fixture:getGroupIndex() == GROUND_INDEX then 
	have_block = true
	return 0
end
	return -1
end



-- ФУНКЦИИ-ДЕЙСТВИЯ 
-- возвращают true, если надо продолжить выполнение 


function CATCH_UP_PLAYER(self)
	local dx = math.abs(self.getX() - player.getX())
	local dy = math.abs(self.getY() - player.getY())
	if dy > dx then
		self.jump()
	end

	return true
end


function CHANGE_DIRECTION(self)
	self.direction = - self.direction

	return true 
end



-- функции хода 
function SINGLE_ENEMY_STEP(self)
	local vx, vy = self.phys.body:getLinearVelocity()
	if math.abs(vx) > self.characteristics.maxVx then
		return
	end

	self.phys.body:applyForce(self.characteristics.stepForce * self.direction, 0)
end

