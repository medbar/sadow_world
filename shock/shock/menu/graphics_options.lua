
return {

-- Fullscreen	
{
	x = 0.3,
	y = 0.1,
	texture_name = "graphics/menu/checkbox.png", 
	text = "Fullscreen", 
	fontSize = 25,
	action = CHANGE_FULLSCREEN,
	
	init = function(self, textures) 
				self.quads = {}
				local imgW, imgH = textures[self.texture_name]:getDimensions()

				self.quads[false] = love.graphics.newQuad(0, 0, imgW / 2, imgH, imgW, imgH)
				self.quads[true] =  love.graphics.newQuad(imgW / 2, 0, imgW / 2, imgH, imgW, imgH)
			end,

	-- объявляем свой способ отрисовки
	draw = function(self, textures)
				love.graphics.draw(textures[self.texture_name],
							self.quads[options.graphics.fullscreen],
							self.x * options.resolution.x  -  textures[self.texture_name]:getWidth() / 2,
							self.y * options.resolution.y  -  textures[self.texture_name]:getHeight() / 2)
				
			end,
	
	drawText = function(self)
						love.graphics.draw(self.TEXT, self.x * options.resolution.x +  7,
													  self.y * options.resolution.y - self.TEXT:getHeight()/2 )
				end
},



{ x = 0.8, y = 0.9 , texture_name  = "graphics/menu/botton.bmp", text = "back",fontSize = 18, action = GO_BACK}				
}


