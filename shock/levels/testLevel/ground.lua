-- загружаем все поверхности и все текстуры для них, с физическими характеристиками



return {	
	--левая стенка 
			{
				texture_name = "graphics/game/cobble.jpg",
				x = 0,
				y = 350,
				init = MESH_OBJECT, 
				mode = "fan",
				vertices = {{0, 0}, 
							{0, 300},
							{100, 300},
							{100, 0}
							},
			},
	--первый блок земли
			{
				texture_name = "graphics/game/dirt.jpg",
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
			--правая стенка 
			{
				texture_name = "graphics/game/cobble.jpg",
				x = 650,
				y = 450,
				init = MESH_OBJECT, 
				mode = "fan",
				vertices = {{0, 0}, 
							{0, 200},
							{100, 200},
							{100, 0}
							},
			},
	 --второй блок земли
	 		{
	 			texture_name = "graphics/game/dirt.jpg",
	 			x = 950,
	 			y = 650,
	 			init = MESH_OBJECT, 
	 			mode = "fan",
	 			vertices = {
	 						{0, 0},
	 						{300,0}, 
	 						{300, -100},
	 						{400, -400},
	 						{400, 200},
	 						{0,200},
	 						},		
	 		},
	-- блок, висящий в воздухе
			{
				texture_name = "graphics/game/skyBlock.png",
				x= 1350, 
				y =550,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {	
					{--left-top
						0, 0,
						---2, -2
					}, 
					{--hill
						200, -375,
						--0, -3 
					},
					{--right-top
						400, 0,
						--2, -2,

					},
					{--right-bot
						400, 50,
						--2, 2,

					},
					{--left-bot
						0, 50,
						---2, 2,
					}, 
							
							
				},

			},
	--

	
}