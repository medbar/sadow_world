-- объекты с которыми взаимодействует гг
-- объекты невидимые 


return {
		--


	-- смертельная зона
	{ 
		x = 0,
		y = SEA_LEVEL + 1200,
		width = 20000,
		height = 250,
		object_type = "static",
		init = INIT_VOID,
		beginContact = function(a,b,coll)
							if b:getUserData().die then
								b:getUserData():die()
							end
						end
	},
}
