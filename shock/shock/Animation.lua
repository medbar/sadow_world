

function ANIMATED_OBJECT(self, textures)	
	self.draw = DRAW_ANIMATED_OBJ		
	self.frameId = self.number_of_frames
	self.timer =  - self.frame_dt


	self.quads = {}
		local imgW, imgH = textures[self.tFile]:getDimensions()
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
		love.graphics.draw(textures[self.tFile],
							self.quads[self.frameId],
							self.x,
							self.y)

end