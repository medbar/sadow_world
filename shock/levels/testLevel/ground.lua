-- загружаем все поверхности и все текстуры для них, с физическими характеристиками



return {	
	--первый блок земли
			{
				texture_name = "graphics/game/dirt.jpg",
				x = 650,
				y = 650-50/2,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {{-600, 0}, 
							{300, 0},
							{300, 100},
							{-600, 100}
							},
						
			},
	--левая стенка 
			{
				texture_name = "graphics/game/cobble.jpg",
				x = 50/2,
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
				texture_name = "graphics/game/skyBlock.png",
				x= 950, 
				y =850,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {{0, -500}, 
							{100, -500},
							{100, 500},
							{0, 500}
							},			
			},
	--

	
}