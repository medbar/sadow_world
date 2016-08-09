return {
	--[1]
	{
		x = 0.5, y = 0.35,
		texture_name = "",
		text = "ХА, ПРОДУЛ", fontSize = 70,
		disableFocus = true,
		init = INIT_VOID,
		action = DO_NOTHING 
	},
	--[2]
	{
		x = 0.48, y = 0.50,
		texture_name = "graphics/menu/botton.bmp", 
		text = "Новая игра", fontSize = FONT_FOR_BOTTON, 
		action = NEW_GAME 
	},
	--[3] 
	{
		x = 0.48, y = 0.75, 
		texture_name = "graphics/menu/botton.bmp", 
		text = "Главное меню", fontSize = FONT_FOR_BOTTON-2, 
		action = GO_TO_MAIN_MENU 
	},
		--
	escape = 3, -- кнопка, забитая на escape
		-- сюды можно вписать новые кнопки по примерам
		
}