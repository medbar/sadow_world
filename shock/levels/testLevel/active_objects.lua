-- объекты с которыми взаимодействует гг
-- объекты невидимые 


return {
		--
	{ 
		x = 3800,
		y = 300,
		width = 150,
		height = 150,
		object_type = "static",
		texture_name = "graphics/game/testLevel/flag.png",
		init = IMAGE_OBJECT,
		beginContact = function(a,b,coll)
							if b:getUserData() == player then
								WIN()
							end
						end
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
		beginContact =  function(a,b,coll)
							if b:getUserData() == player and not a:getUserData().isrepeat then
								a:getUserData().isrepeat = true
								GO_TO_DIALOG("with_invisible_cube")
							end
						end
	}
}
