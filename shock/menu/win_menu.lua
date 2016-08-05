return {
	{
		x = 0.5, y = 0.35,
		texture_name = "",
		text = "!!!ПОБЕДА!!!", fontSize = 70,
		disableFocus = true,
		init = INIT_VOID,
		action = DO_NOTHING 
	},
	--
	{
		x = 0.5, y = 0.50,
		texture_name = "graphics/menu/botton.bmp", 
		text = "Новая игра", fontSize = FONT_FOR_BOTTON, 
		action = NEW_GAME 
	},
	-- 
	{
		x = 0.5, y = 0.8, 
		texture_name = "graphics/menu/botton.bmp", 
		text = "Главное меню", fontSize = FONT_FOR_BOTTON-2, 
		action = GO_TO_MAIN_MENU 
	},
		--

		-- сюды можно вписать новые кнопки по примерам
		
}