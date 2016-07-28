-----------------------------������������� ����������� ��������--------------------------------------------------

function INIT_COLLECTION(self, collName)
	for i, obj in ipairs(self[collName]) do
		if not self.textures[obj.texture_name] then
			self.textures[obj.texture_name] = love.graphics.newImage(obj.texture_name)
		end
		if obj.init == nil then
			obj.init = IMAGE_OBJECT
		end
		obj:init(self.textures)
	end

end

--init - ���������� ������ �������� � ������ ��������� ������� 
--init ����� ����:
--					POLYGON - ������, ������� � ������� ������� love.graphics.polygon. ������������ ���� - mode = ("fill" or "line")
																										--color = { r, g, b ,a},
																										--vertices =  {x1,y1,x2,y2,...} 
--					IMAGE_OBJECT	- ������, ������������� �� ��������.  
--					ANIMATED_OBJECT	- ������������� ������, �������� �� ������.   
--					FROM_ATLAS	-   ������, ������������� �� ������. ������������ ���� - WrapMode = ("repeat" or "clamp" or "clampzero" or morroredrepeat),
--																						 width, height, xInPic, yInPic
--
--  ��� �������� ����������� : texture_name, number_of_frames, frame_dt 
--  texture_name - ����� ������� ������, ����� ������������ ���� �� ������ ����� ��� �
-- number_of_frames - ���������� ������
-- ����� �������� = (���-�� ������) * ������ 1 �����
-- frame_dt - ��������(� �������) ����� ������� ������ ��������


function POLYGON(self)
	self.draw = function(self) 
							love.graphics.setColor(self.color)
							love.graphics.polygon(self.mode, self.vertices)
				end

end

function FROM_ATLAS()
	-------------------------------��������
end

function IMAGE_OBJECT(self, textures)
	if self.x < 1 and self.x > 0 then
	self.draw = function(self,textures)
							love.graphics.draw(textures[self.texture_name],
							self.x * options.resolution.x -  textures[self.texture_name]:getWidth() / 2,
							self.y * options.resolution.y  -  textures[self.texture_name]:getHeight() / 2)
				end
	else
		self.draw = function(self, textures)
							love.graphics.draw(textures[self.texture_name],
							self.x,
							self.y)
					end
	end
end





function ANIMATED_OBJECT(self, textures)	
	self.draw = DRAW_ANIMATED_OBJ		
	self.frameId = self.number_of_frames
	self.timer =  - self.frame_dt


	self.quads = {}
		local imgW, imgH = textures[self.texture_name]:getDimensions()
		local CadrWidth = imgW / self.number_of_frames
		for x = 0, imgW, CadrWidth do
			table.insert(self.quads, love.graphics.newQuad(x, 0, CadrWidth, imgH, imgW, imgH))
		end
end


function DRAW_ANIMATED_OBJ(self, textures)
	local time = love.timer.getTime()
	if time-self.timer > self.frame_dt then
			self.timer = time
			self.frameId = self.frameId + 1
			if self.frameId > self.number_of_frames then 
				self.frameId =1 
			end
		end
		if self.x < 1 and self.x > 0 then
			love.graphics.draw(textures[self.texture_name],
							self.quads[self.frameId],
							self.x * options.resolution.x  -  textures[self.texture_name]:getWidth() / 2,
							self.y * options.resolution.y  -  textures[self.texture_name]:getHeight() / 2)
		else 
		love.graphics.draw(textures[self.texture_name],
							self.quads[self.frameId],
							self.x,
							self.y)
		end

end