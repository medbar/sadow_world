
return {

	--[1] Fullscreen	
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
								self.x * options.resolution.w  -  textures[self.texture_name]:getWidth() / 2,
								self.y * options.resolution.h  -  textures[self.texture_name]:getHeight() / 2)
					
				end,
		
		drawText = function(self)
							love.graphics.draw(self.TEXT, self.x * options.resolution.w +  7,
														  self.y * options.resolution.h - self.TEXT:getHeight()/2 )
					end
	},

--

	--[2] resolution left
	{
		x = 0.25, 
		y = 0.3,
		texture_name = "graphics/menu/arrows.png",
		text = "",
		fontSize = 1,
		init = FROM_ATLAS,
		width = 40, height = 40, xInPic = 0, yInPic = 0,
		action = RESOLUTION_REDUCE
	},

	--[3] resolution left
	{
		x = 0.45, 
		y = 0.3,
		texture_name = "graphics/menu/arrows.png",
		text = "",
		fontSize = 1,
		init = FROM_ATLAS,
		width = 40, height = 40, xInPic = 40, yInPic = 0,
		action = RESOLUTION_INCREASE
	},

 	--[4] resolution
	{
		x = 0.33,
		y = 0.3,
		texture_name = "graphics/menu/text.png", 
		text = "", 
		fontSize = 20,
		action = DO_NOTHING,
		init = IMAGE_OBJECT,
	--	init = function(self, textures) 
	
	--			end,
	--	draw = function(self, textures)
	
	--			end,
		drawText = function(self)
							self.TEXT:set(options.resolution.w .. "X" ..options.resolution.h)  
							love.graphics.draw(self.TEXT, self.x * options.resolution.w - self.TEXT:getWidth()/2 ,
														  self.y * options.resolution.h - self.TEXT:getHeight()/2 )
					end


	},

	--[5]
	{ 
		x = 0.8, y = 0.9 , 
		texture_name  = "graphics/menu/botton.bmp", 
		text = "Назад",fontSize = FONT_FOR_BOTTON, 
		action = GO_BACK
	},	
	escape = 5, -- кнопка, забитая на escape			
}


