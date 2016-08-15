-- объекты с которыми взаимодействует гг
-- объекты невидимые 


return {
		--

	--Лестница в подвал
	{
		texture_name = "graphics/game/London/stairs.png",
		x = BASEMENT - 150,
		y = SEA_LEVEL - 100,
		object_type = "static",
		init = MESH_OBJECT,
		physScaleX = 0.1,
		physScaleY = 0.94,
		mode = "fan", 
				vertices = {
							{-40, 0, 0},
							{40, 0, 1},	
							{40, 1900, 1,50},
							{-40, 1900,0,50}
							},
		beginContact = function(a,b,coll)
							if b:getUserData() == player then
								player.onStairs = false
								player.stairs = a:getUserData()
							end
						end,
		endContact = function(a,b,coll)
							if b:getUserData() == player then
								a:getUserData().drop()
							end
						end,
		drop = function()
						player.onStairs = nil
						player.stairs = nil
						player.fixture:setSensor(false)
						player.body:setGravityScale(1)
					end,

	},
	--Лестница из покера
	{
		texture_name = "graphics/game/London/stairs.png",
		x =BASEMENT + 4600,
		y = SEA_LEVEL - 100,
		object_type = "static",
		init = MESH_OBJECT,
		physScaleX = 0.1,
		physScaleY = 0.94,
		mode = "fan", 
				vertices = {
							{-40, 0, 0},
							{40, 0, 1},	
							{40, 1500, 1,50},
							{-40, 1500,0,50}
							},
		beginContact = function(a,b,coll)
							if b:getUserData() == player then
								player.onStairs = false
								player.stairs = a:getUserData()
							end
						end,
		endContact = function(a,b,coll)
							if b:getUserData() == player then
								a:getUserData().drop()
							end
						end,
		drop = function()
						player.onStairs = nil
						player.stairs = nil
						player.fixture:setSensor(false)
						player.body:setGravityScale(1)
					end,

	},




	-- смертельная зона
	{ 
		x = 0,
		y = SEA_LEVEL + 10000,
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
