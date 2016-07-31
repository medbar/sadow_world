
function DRAW_CONTOL_KEY(self)
	
	self.TEXT:set(options.controls[self.name])

	love.graphics.draw(self.TEXT, self.x * options.resolution.w -  self.TEXT:getWidth() / 2,
									self.y * options.resolution.h - self.TEXT:getHeight() / 2 )
end

local labelFont = 25
local keyFont = 18
return {

-- left
{
	name = "left",
	x = 0.3, 
	y = 0.1,
	texture_name = "graphics/menu/text.png",
	text = "sample",
	fontSize = keyFont,
	init = IMAGE_OBJECT,
	drawText = DRAW_CONTOL_KEY,
	action = CHANGE_CONTROL_KEY
},

--lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.1,
	text = "left",
	fontSize = labelFont,
	init = INIT_VOID,
},

-- right
{
	name = "right",
	x = 0.3, 
	y = 0.25,
	texture_name = "graphics/menu/text.png",
	text = "",
	fontSize = keyFont,
	init = IMAGE_OBJECT,
	drawText = DRAW_CONTOL_KEY,
	action = CHANGE_CONTROL_KEY
},
--lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.25,
	text = "left",
	fontSize = labelFont,
	init = INIT_VOID,
},
 -- jump
{
	name = "jump",
	x = 0.3, 
	y = 0.4,
	texture_name = "graphics/menu/text.png",
	text = "",
	fontSize = keyFont,
	init = IMAGE_OBJECT,
	drawText = DRAW_CONTOL_KEY,
	action =  CHANGE_CONTROL_KEY
},
--lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.4,
	text = "jump",
	fontSize = labelFont,
	init = INIT_VOID,
},
--attack
{
	name = "attack",
	x = 0.3, 
	y = 0.55,
	texture_name = "graphics/menu/text.png",
	text = "",
	fontSize = keyFont,
	init = IMAGE_OBJECT,
	drawText = DRAW_CONTOL_KEY,
	action = CHANGE_CONTROL_KEY

},
--lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.55,
	text = "attack",
	fontSize = labelFont,
	init = INIT_VOID,
},
--pause
{
	name = "pause",
	x = 0.3, 
	y = 0.7,
	texture_name = "graphics/menu/text.png",
	text = "",
	fontSize = keyFont,
	init = IMAGE_OBJECT,
	drawText = DRAW_CONTOL_KEY,
	action =  CHANGE_CONTROL_KEY
},
--lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.7,
	text = "pause",
	fontSize = labelFont,
	init = INIT_VOID,
},
-- back
{ x = 0.8, y = 0.9 , texture_name  = "graphics/menu/botton.bmp", text = "back",fontSize = 18, action = GO_BACK}		
		
}