-----------------------------представление графичиских объектов--------------------------------------------------

function INIT_COLLECTION(self, collName)
	for i, obj in ipairs(self[collName]) do
		if obj.texture_name == nil then 
			obj.texture_name = "graphics/sample_texture.bmp"
		end
		if obj.init ~= INIT_VOID then
			if not self.textures[obj.texture_name] then
				self.textures[obj.texture_name] = love.graphics.newImage(obj.texture_name)
			end
			if obj.init == nil then
				obj.init = IMAGE_OBJECT
			end
		end
		obj:init(self.textures)
	end


end


function INIT_PHYSICS(b, obj_type, groupIndex, isSensor)
	b.body = love.physics.newBody(game.world, b.x, b.y, obj_type)

		
		if b.init == MESH_OBJECT then
			
			local v ={}
			for j, point in ipairs(b.vertices) do
				if b.physScaleX ~= nil then 

					table.insert(v, point[1] * b.physScaleX)
					table.insert(v, point[2] * b.physScaleY)
				else
					table.insert(v, point[1])
					table.insert(v, point[2])
				end	
			end
			b.shape = love.physics.newPolygonShape(v)
		elseif b.init == IMAGE_OBJECT then
			b.shape = love.physics.newRectangleShape(b.hitbox_ox,b.hitbox_oy,b.width, b.height) 
		else 
			return
		end

		
		b.fixture = love.physics.newFixture(b.body, b.shape)
		b.fixture:setUserData(b)

		b.fixture:setSensor(isSensor)
		b.fixture:setFriction(0.9)
		b.fixture:setGroupIndex(groupIndex)

end
-- init - определяет способ загрузки и способ отрисовки объекта
-- init может быть:
-- 				VOID - объекта нет
-- 				POLYGON - объект, рисуемы с помошью функции love.graphics.polygon. Обязательные поля - mode = ("fill" or "line")
--													 color = { r, g, b ,a},
-- 													vertices =  {x1,y1,x2,y2,...}
--				MESH_OBJECT - mesh с заданной текстурой. Обязательно:  texture_name, 
--																		mode
--																		vertices =  {x1,y1,x2,y2,...}
-- 				IMAGE_OBJECT	- объект, загружающийся из картинки.
-- 				ANIMATED_OBJECT	- анимированный объект, грузится из атласа.
-- 				FROM_ATLAS	-   объект, загружающийся из атласа. Обязательные поля - width, height, xInPic, yInPic
--
--  для анимации обязательны : texture_name, number_of_frames, frame_dt
--  texture_name - атлас текстур кадров, кадры расположенны друг за другом вдоль оси х
-- number_of_frames - количество кадров
-- длина картинки = (кол-во кадров) * ширина 1 кадра
-- frame_dt - интервал(в екундах) между сменами кадров анимации


function INIT_VOID(self)
	self.draw = DRAW_VOID
end


function DRAW_VOID(self)
end


function POLYGON(self)
	self.draw = function(self)
		love.graphics.setColor(self.color)
		love.graphics.polygon(self.mode, self.vertices)
	end

end


function MESH_OBJECT(self,textures)
		--CANNOT BE WITH SCALED_COORDS
		self.draw = DRAW_MESH_OBJECT

		textures[self.texture_name]:setWrap("repeat", "repeat") 
		local w,h = textures[self.texture_name]:getDimensions()
		
		for i,v in ipairs(self.vertices)do
			if v[3] == nil then
				v[3] = v[1]/w
			end
			if v[4] == nil then
				v[4] = v[2]/h
			end
		end
		self.mesh = love.graphics.newMesh(self.vertices, 
											self.mode)
		self.mesh:setTexture(textures[self.texture_name])
end


function DRAW_MESH_OBJECT(self, textures)
	love.graphics.draw(self.mesh,self.x,self.y)

end	


function IMAGE_OBJECT(self, textures)
	self.frameWidth = textures[self.texture_name]:getWidth()
	if self.x == nill then 
		self.draw =  DRAW_IMAGE_OBJECT
		return 
	end
	if self.x < 1 and self.x > 0 then
		self.draw = SCALE_DRAW_IMAGE_OBJECT
	else
		self.draw = DRAW_IMAGE_OBJECT
	end
end


function SCALE_DRAW_IMAGE_OBJECT(self, textures,x,y)
	if x == nil then 
		x = self.x
		y = self.y
	end

	-- if arg[2] == nil then 
	-- 	arg = {0.5,1,1,0,0,0,0, n=7}

	-- end	
	love.graphics.push()
	love.graphics.origin()
	love.graphics.draw(textures[self.texture_name],
	x * options.resolution.w - textures[self.texture_name]:getWidth() / 2,
	y * options.resolution.h - textures[self.texture_name]:getHeight() / 2,
	self.r, self.sx,self.sy,self.ox,self.oy
	)
	love.graphics.pop()
end


function DRAW_IMAGE_OBJECT(self, textures,x,y)
	if x == nil then 
		x = self.x
		y = self.y
	end

	love.graphics.draw(textures[self.texture_name],
	x - textures[self.texture_name]:getWidth() / 2,
	y - textures[self.texture_name]:getHeight() / 2,
	self.r, self.sx,self.sy,self.ox,self.oy)
end


function ANIMATED_OBJECT(self, textures)

	self.frameId = self.number_of_frames
	self.timer = - self.frame_dt


	self.quads = { }
	local imgW, imgH = textures[self.texture_name]:getDimensions()
	self.frameWidth = imgW / self.number_of_frames
	for x = 0, imgW, self.frameWidth do
		table.insert(self.quads, love.graphics.newQuad(x, 0, self.frameWidth, imgH, imgW, imgH))
	end


	if self.x == nill then 
		self.draw =  DRAW_ANIMATED_OBJ
		return 
	end

	if self.x < 1 and self.x > 0 then
		self.draw = SCALE_DRAW_ANIMATED_OBJ
	else
		self.draw = DRAW_ANIMATED_OBJ
	end
end


function SCALE_DRAW_ANIMATED_OBJ(self, textures,x,y)
	if x == nil then 
		x = self.x
		y = self.y
	end

	love.graphics.push()
	love.graphics.origin()
	local time = love.timer.getTime()
	if time - self.timer > self.frame_dt then
		self.timer = time
		self.frameId = self.frameId + 1
		if self.frameId > self.number_of_frames then
			self.frameId = 1
		end
	end

	love.graphics.draw(textures[self.texture_name],
	self.quads[self.frameId],
	x * options.resolution.w - (self.frameWidth/self.number_of_frames) / 2,
	y * options.resolution.h - textures[self.texture_name]:getHeight() / 2,
	self.r, self.sx,self.sy,self.ox,self.oy)

	love.graphics.pop()
end

function DRAW_ANIMATED_OBJ(self, textures,x,y)
	if x == nil then 
		x = self.x
		y = self.y
	end

	local time = love.timer.getTime()
	if time - self.timer > self.frame_dt then
		self.timer = time
		self.frameId = self.frameId + 1
		if self.frameId > self.number_of_frames then
			self.frameId = 1
		end
	end

	love.graphics.draw(textures[self.texture_name],
	self.quads[self.frameId],
	x - self.frameWidth / 2,
	y - textures[self.texture_name]:getHeight() / 2,
	self.r, self.sx,self.sy,self.ox,self.oy)
end

function SINGLE_ANIMATION(self, textures)

	self.frameId = 0
	self.timer = - self.frame_dt


	self.quads = { }
	local imgW, imgH = textures[self.texture_name]:getDimensions()
	self.frameWidth = imgW / self.number_of_frames
	for x = 0, imgW, self.frameWidth do
		table.insert(self.quads, love.graphics.newQuad(x, 0, self.frameWidth, imgH, imgW, imgH))
	end


	
	self.draw = DRAW_SINGLE_ANIMATION

end

function DRAW_SINGLE_ANIMATION(self,textures,x,y)
	if x == nil then 
		x = self.x
		y = self.y
	end

	local time = love.timer.getTime()
	if time - self.timer > self.frame_dt then
		self.timer = time
		self.frameId = self.frameId + 1
		if self.frameId > self.number_of_frames then
			self.frameId = 1
			return true -- анимация закончилась
		end
	end

	love.graphics.draw(textures[self.texture_name],
	self.quads[self.frameId],
	x - self.frameWidth / 2,
	y - textures[self.texture_name]:getHeight() / 2,
	self.r, self.sx,self.sy,self.ox,self.oy)
end

function FROM_ATLAS(self, textures)
	self.quad = love.graphics.newQuad(self.xInPic, self.yInPic,
	self.width, self.height,
	textures[self.texture_name]:getDimensions())

	if self.x < 1 and self.x > 0 then
		self.draw = SCALE_DRAW_FROM_ATLAS
	else
		self.draw = DRAW_FROM_ATLAS
	end
end


function SCALE_DRAW_FROM_ATLAS(self, textures)
	love.graphics.push()
	love.graphics.origin()
	love.graphics.draw(textures[self.texture_name],
	self.quad,
	self.x * options.resolution.w - textures[self.texture_name]:getWidth() / 2,
	self.y * options.resolution.h - textures[self.texture_name]:getHeight() / 2)
	love.graphics.pop()
end


function DRAW_FROM_ATLAS(self, textures)
	love.graphics.draw(textures[self.texture_name],
	self.quad,
	self.x,
	self.y)
end













function DRAW_CLEVER_MODEL(self, textures, id, x,y)
	love.graphics.setColor(255, 255, 255)
	self[id].r = 0
	self[id].sx = player.direction
	self[id].sy = 1 
	if player.direction ==-1 then
		self[id].ox = self[id].frameWidth
	else
		self[id].ox = 0
	end

	self[id].oy = 0
	if self[id]:draw(textures,x,y) then
		player.pS = 1
		self[id]:draw(textures,x,y)
	end
end