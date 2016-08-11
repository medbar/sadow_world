
-- функции поведения мышей




--ФУНКЦИИ-ЦЕЛИ мышей, возвращают вероятность действия и функцию-дейстиве

function STOP_TARGET(self)
	return 1, ENEMY_STOP
end


function CATCH_UP_PLAYER_TARGET(self)
	local dx = math.abs(ENEMY_GET_X(self) - player.getX())
	local dy = math.abs(ENEMY_GET_Y(self) - player.getY())
		DEBUG_STATIC = dx.." "..dy.."\n"..ENEMY_GET_X(self).." "..ENEMY_GET_Y(self).."\n"
	return self.characteristics.bloodLust/dx , CATCH_UP_PLAYER

end   





function AVOID_DEATH_TARGET(self)
	--будущее положение
	local vx,vy = self.phys.body:getLinearVelocity()
	self.futureX = vx + ENEMY_GET_X(self)
	self.futureY = vy + ENEMY_GET_Y(self)
	
	-- -- проверяем, нету ли впереди стенки, а то страшно, вдруг стенка, тогда вообще гг
	-- have_block = false
	-- game.world:rayCast(ENEMY_GET_X(self), ENEMY_GET_Y(self),
	--  					vx,  vy , SAMPLE_INSPECTION )
	-- if have_block then
	-- 	--есть
	-- 	return 0.9, TURN_AND_STEP
	-- end

	have_block = false
	game.world:rayCast(ENEMY_GET_X(self)+self.characteristics.width*self.direction, ENEMY_GET_Y(self),
						ENEMY_GET_X(self)+self.characteristics.width*self.direction,ENEMY_GET_Y(self) + self.characteristics.height *5,
						SAMPLE_INSPECTION)

	if not have_block then
		--нету блока --> туда нельзя, а то упаду ещё
		return 1, ENEMY_STOP
	end

	return 0,DO_NOTHING 

end



-- callback's для всяких проверок

function SAMPLE_INSPECTION(fixture, x, y, xn, yn, fraction)
if fixture:isSensor() then
	return 1
elseif fixture:getGroupIndex() == GROUND_INDEX then 
	have_block = true
	return 1
elseif fixture:getGroupIndex() == SHOCK_INDEX then 
	have_block = false
	return 1
end
	
end



-- ФУНКЦИИ-ДЕЙСТВИЯ 
-- возвращают true, если надо продолжить выполнение 


function CATCH_UP_PLAYER(self)
	local dx = self.phys.body:getX() - player.getX()
	local dy = self.phys.body:getY() - player.getY()
	--if dy > dx then
	--	self.jump()
	--end
	if dx * self.direction > 20 then
		CHANGE_DIRECTION(self)
	end

	SINGLE_ENEMY_STEP(self)
	return false
end


function CHANGE_DIRECTION(self)
	self.direction = - self.direction

	return true 
end


function TURN_AND_STEP(self)
	if self.direction * self.phys.body:getLinearVelocity() > 0 then
		CHANGE_DIRECTION(self)
	end
	return SINGLE_ENEMY_STEP(self)
end

-- функции хода 
function SINGLE_ENEMY_STEP(self)
	local vx, vy = self.phys.body:getLinearVelocity()
	if vx*self.direction > self.characteristics.maxVx then
		return
	end

	self.phys.body:applyForce(self.characteristics.stepForce * self.direction, 0)
end


function ENEMY_STOP(self)
	local vx, vy = self.phys.body:getLinearVelocity()
	--CHANGE_DIRECTION(self)
	if math.abs(vx) < 10 then
		return false
	end
	--CHANGE_DIRECTION(self)
	--self.phys.body:applyForce(self.characteristics.stepForce * self.direction, 0)
	return false
end




-- CALLBACKS


function JUMP_ON_THE_UMBRELLA(a,b,coll)
	local xn,yn = coll:getNormal()
	--if math.abs(xn) < math.abs(yn) then
	if yn >0 then 
		if b:getUserData() == player then
			local x,y = player.body:getLinearVelocity() 	
			player.body:setLinearVelocity(x, -y-50)
		end
	end
end