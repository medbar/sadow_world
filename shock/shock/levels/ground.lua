-- загружаем все поверхности и все текстуры для них, с физическими характеристиками



return {	
	--первый блок земли
			{
				texture_name = "graphics/dirt.png",
				x = 650,
				y = 650-50/2,
				init = FROM_ATLAS, 
				
				w = 1300,
				h = 50		
			},
	--левая стенка 
			{
				texture_name = "graphics/cobble.jpg",
				x = 50/2,
				y = 650/2,
				w = 50, 
				h = 600		
			},
	--второй блок земли
			{
				texture_name = "graphics/dirt.png",
				x = 650,
				y = 600 - 50/2,
				w = 1300,
				h = 50			
			},
	-- блок, висящий в воздухе
			{
				texture_name = "graphics/skyBlock.png",
				x= 650, 
				y =550,
				w = 50,
				h = 50				
			},
	--

	
}