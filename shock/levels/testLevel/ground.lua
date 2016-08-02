-- загружаем все поверхности и все текстуры для них, с физическими характеристиками



return {	
	--первый блок земли
			{
				texture_name = "graphics/game/grass.jpg",
				x = 0,
				y = 650,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{600, 0}, 							
							{600, 200},
							{0, 200}
							},
						
			},
	--левая стенка 
			{
				texture_name = "graphics/game/skyBlock.png",
				x = 0,
				y = 650/2,
				init = MESH_OBJECT, 
				mode = "fan",
				vertices = {{0, 0}, 
							{0, -300},
							{100, -300},
							{100, 0}
							},
			},
	-- --второй блок земли
	-- 		{
	-- 			texture_name = "graphics/game/dirt.jpg",
	-- 			x = 950,
	-- 			y = 900 - 50/2,
	-- 			init = MESH_OBJECT, 
	-- 			mode = "fan",
	-- 			vertices = {{0, 0}, 
	-- 						{300, 0},
	-- 						{300, 100},
	-- 						{0, 100}
	-- 						},		
	-- 		},
	-- блок, висящий в воздухе
			{
				texture_name = "graphics/game/cobble.jpg",
				x= 950, 
				y =550,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {	
					{--left-top
						-200, -50,
						---2, -2
					}, 
					{--hill
						0, -75,
						--0, -3 
					},
					{--right-top
						200, -50,
						--2, -2,

					},
					{--right-bot
						200, 50,
						--2, 2,

					},
					{--left-bot
						-200, 50,
						---2, 2,
					}, 
							
							
				},

			},
	--

	
}