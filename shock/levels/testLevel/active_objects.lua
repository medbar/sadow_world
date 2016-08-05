-- объекты с которыми взаимодействует гг
-- объекты невидимые 


return {
		--
	{ 
		x = 3800,
		y = 300,
		width = 200,
		height = 200,
		object_type = "static",
		texture_name = "graphics/game/testLevel/flag.png",
		init = IMAGE_OBJECT,
		beginContact = WIN
	},
		--
		--  и другие объекты 


	{
		x = 2000,
		y = 450,
		width = 200,
		height = 200,
		object_type = "static",
		init = INIT_VOID,
		beginContact =  dialog
	}
}
