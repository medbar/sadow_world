-- загружаем все поверхности и все текстуры для них, с физическими характеристиками


SEA_LEVEL = 1450
EARTH_SIZE = 36
FIRST_HOUSE_X = 1900
FIRST_HOUSE_Y = SEA_LEVEL - 418  
local START_STAIRS = 4


local result = {
	
------------------СТАРТОВАЯ МИНИЛОКАЦИЯ -------------
--  [1] --> [2]  - ЗЕМЛЯ	
	--СТАРТОВАЯ ВОЗВЫШЕННОСТЬ
			{
				texture_name = "graphics/game/London/earth.png",
				x = 0,
				y = SEA_LEVEL - (EARTH_SIZE * (START_STAIRS+1)) ,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{688, 0},	
							{688, EARTH_SIZE},
							{0, EARTH_SIZE}
							},
						
			},	
			
	-- ДЛИННАЯ МОСТОВАЯ
			{
				texture_name = "graphics/game/London/earth.png",
				x = 688+ (EARTH_SIZE * START_STAIRS),
				y = SEA_LEVEL,
				init = MESH_OBJECT, 
				mode = "fan",
				vertices = {
							{0, 0}, 
							{4000, 0},
							{4000, EARTH_SIZE},
							{0, EARTH_SIZE}
							},
			},
	







-- [.] -> [.] платформы в воздухе
			{
				texture_name = "graphics/game/London/balcony.png",
				x = FIRST_HOUSE_X + 135, 
				y = FIRST_HOUSE_Y -125,
				width = 200,
				height = 31,
				hitbox_ox = 0,
				hitbox_oy = 0,
				init = IMAGE_OBJECT,
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},



			{
				texture_name = "graphics/game/London/balcony.png",
				x = FIRST_HOUSE_X + 487, 
				y = FIRST_HOUSE_Y - 125,
				width = 200,
				height = 31,
				hitbox_ox = 0,
				hitbox_oy = 0,
				init = IMAGE_OBJECT,
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},


			{
				texture_name = "graphics/game/London/DIVAN.png",
				x = FIRST_HOUSE_X +143, 
				y = SEA_LEVEL - 45,
				width = 270,
				height = 20,
				hitbox_ox = 0,
				hitbox_oy = 20,
				init = IMAGE_OBJECT,
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},


			{
				texture_name = "graphics/game/London/shop.png",
				x = FIRST_HOUSE_X +489, 
				y = SEA_LEVEL - 128,
				width = 340,
				height = 40,
				hitbox_ox = 0,
				hitbox_oy = -87,
				init = IMAGE_OBJECT,
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},

			{
				texture_name = "graphics/game/London/tree.png",
				x = FIRST_HOUSE_X -240, 
				y = SEA_LEVEL - 370,
				width = 280,
				height = 20,
				hitbox_ox = 110,
				hitbox_oy = 0,
				init = IMAGE_OBJECT,
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},

			{
				--texture_name = "graphics/game/London/earth.png",
				x = FIRST_HOUSE_X -240 - 140, 
				y = SEA_LEVEL - 460,
				width = 110,
				height = 20,
				hitbox_ox = 0,
				hitbox_oy = 0,
				init = INIT_VOID,
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			}


}
------------------------------------------------------------------


	





------------------- динамическая генерация объектов------------------------------- 




for i=1,START_STAIRS do
	table.insert(result,
		{
				texture_name = "graphics/game/London/earth.png",
				x = result[1].vertices[3][1] + (i-1)*EARTH_SIZE,
				y = result[1].y + i*EARTH_SIZE,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{EARTH_SIZE, 0},
							{EARTH_SIZE, EARTH_SIZE},
							{0, EARTH_SIZE}
						}
		}
	)
end





---------------------------------------------------------------------------------------
return result