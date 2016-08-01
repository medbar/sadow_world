-----------------------------представление графичиских объектов--------------------------------------------------

function INIT_COLLECTION(self, collName)
	for i, obj in ipairs(self[collName]) do
		if obj.texture_name then
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
		
		self.mesh = love.graphics.newMesh(self.vertices, 
											self.mode)
		self.mesh:setTexture(textures[self.texture_name])
end

function DRAW_MESH_OBJECT(self, textures)
	love.graphics.draw(self.mesh,self.x,self.y)

end	




function IMAGE_OBJECT(self, textures)
	if self.x < 1 and self.x > 0 then
		self.draw = SCALE_DRAW_IMAGE_OBJECT
	else
		self.draw = DRAW_IMAGE_OBJECT
	end
end

function SCALE_DRAW_IMAGE_OBJECT(self, textures)
	love.graphics.push()
	love.graphics.origin()
	love.graphics.draw(textures[self.texture_name],
	self.x * options.resolution.w - textures[self.texture_name]:getWidth() / 2,
	self.y * options.resolution.h - textures[self.texture_name]:getHeight() / 2)
	love.graphics.pop()
end

function DRAW_IMAGE_OBJECT(self, textures)
	love.graphics.draw(textures[self.texture_name],
	self.x,
	self.y)
end




function ANIMATED_OBJECT(self, textures)

	self.frameId = self.number_of_frames
	self.timer = - self.frame_dt


	self.quads = { }
	local imgW, imgH = textures[self.texture_name]:getDimensions()
	local CadrWidth = imgW / self.number_of_frames
	for x = 0, imgW, CadrWidth do
		table.insert(self.quads, love.graphics.newQuad(x, 0, CadrWidth, imgH, imgW, imgH))
	end


	if self.x < 1 and self.x > 0 then
		self.draw = SCALE_DRAW_ANIMATED_OBJ
	else
		self.draw = DRAW_ANIMATED_OBJ
	end
end

function SCALE_DRAW_ANIMATED_OBJ(self, textures)
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
	self.x * options.resolution.w - textures[self.texture_name]:getWidth() / 2,
	self.y * options.resolution.h - textures[self.texture_name]:getHeight() / 2)

	love.graphics.pop()
end

function DRAW_ANIMATED_OBJ(self, textures)
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
	self.x,
	self.y)
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