
function DRAW_CONTOL_KEY(self)
	
	self.TEXT:set(options.controls[self.name])

	love.graphics.draw(self.TEXT, self.x * options.resolution.w -  self.TEXT:getWidth() / 2,
									self.y * options.resolution.h - self.TEXT:getHeight() / 2 )
end

local labelFont = 25
local keyFont = FONT_FOR_BOTTON
return {

-- [1]left
{
	name = "left",
	x = 0.3, 
	y = 0.1,
	texture_name = "graphics/menu/text.png",
	text = "",
	fontSize = keyFont,
	init = IMAGE_OBJECT,
	drawText = DRAW_CONTOL_KEY,
	action = CHANGE_CONTROL_KEY
},

--[2]lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.1,
	text = "Налево",
	fontSize = labelFont,
	init = INIT_VOID,
},

-- [3]right
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
--[4]lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.25,
	text = "Направо",
	fontSize = labelFont,
	init = INIT_VOID,
},
 --[5] jump
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
--[6]lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.4,
	text = "Прыжок",
	fontSize = labelFont,
	init = INIT_VOID,
},
--[7]attack
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
--[8]lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.55,
	text = "Атака",
	fontSize = labelFont,
	init = INIT_VOID,
},
--[9]pause
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
--[10]lable
{
	disableFocus = true,
	x = 0.4, 
	y = 0.7,
	text = "Пауза",
	fontSize = labelFont,
	init = INIT_VOID,
},
-- [11]back
{ 
	x = 0.8, y = 0.9 , 
	texture_name  = "graphics/menu/botton.bmp", 
	text = "Назад",fontSize = FONT_FOR_BOTTON, 
	action = GO_BACK
},		
		escape = 11, -- кнопка, забитая на escape
}