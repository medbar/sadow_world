-- загружаем все поверхности и все текстуры для них, с физическими характеристиками


SEA_LEVEL = 1450
EARTH_SIZE = 36
FIRST_HOUSE_X = 1900
FIRST_HOUSE_Y = SEA_LEVEL - 418  

BASEMENT = 4500


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
							{10000, 0},
							{10000, EARTH_SIZE},
							{0, EARTH_SIZE}
							},
			},
	







-- [.] -> [.] домишка
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
			},



------------------------------------------------------------------


	


------------------ подвал------------------------------


-- СТЕНКА-ДОМ
			{

				texture_name = "graphics/game/cobble.jpg",
				x = BASEMENT,
				y = SEA_LEVEL,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{700, 0},	
							{700, -600},
							{0, -600}
							},
						
	},	



-- ЗЕМЛЯ ПОД ДОМОМ
	{

				texture_name = "graphics/game/cobble.jpg",
				x = BASEMENT,
				y = SEA_LEVEL + EARTH_SIZE,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{600, 0},	
							{600, 650},
							{0, 650}
							},
						
	},	


-- ЛЕВО-ВЕРХ
			{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT - 600,
				y = SEA_LEVEL + EARTH_SIZE,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{300, 0},	
							{300, 500},
							{0, 500}
							},
						
	},	

-- МОСТ
			{
				texture_name = "graphics/game/London/earth.png",
				x =  BASEMENT - 400,
				y = SEA_LEVEL + 900,
				init = MESH_OBJECT, 
				mode = "fan",
				vertices = {
							{0, 0}, 
							{400, 0},
							{400, EARTH_SIZE},
							{0, EARTH_SIZE}
							},
	},

	-- ЛЕВО-НИЗ
			{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT - 600,
				y = SEA_LEVEL + 900,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{200, 0},	
							{200, 300},
							{0, 300}
							},
						
	},	

	-- БОЧКА В ТЮРМЕ
			{
				texture_name = "graphics/game/skyBlock.png",
				x =BASEMENT - 700,
				y = SEA_LEVEL + 1100,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, 0,0},
							{100, 0, 1,0},	
							{100, 100, 1,1},
							{0, 100, 0,1}
							},
	},
	-- ЛЕВО-НИЗ-ОСНОВАНИЕ
			{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT - 400,
				y = SEA_LEVEL + 1200,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{-1200, 0},	
							{-1200, 300},
							{0, 300}
							},
	},	

	-- левая стенка в тюрме
		{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT - 1600,
				y = SEA_LEVEL +  EARTH_SIZE + 500,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{-1000, 0},	
							{-1000, 2700},
							{0, 2700}
							},
	},	
	-- right bot
			{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT,
				y = SEA_LEVEL + 900,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{600, 0},	
							{600, 1000},
							{0, 1400}
							},
	},	

-- bot platform
			{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT,
				y = SEA_LEVEL + 2000,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{-1000, 0},	
							{-1000, 300},
							{0, 300}
							},
	},

-- самы нижний блок 
			{

				texture_name = "graphics/game/dirt.jpg",
				x =BASEMENT - 1600,
				y = SEA_LEVEL + 2800,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0 , },
							{2400, 0 , },	
							{2400, 300 , },
							{0, 300 , }
							},
	},

-- ГРОМАДНЫЙ РАЗДЕЛИТЕЛЬНЫЙ БЛОК 
			{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT + 600,
				y = SEA_LEVEL + EARTH_SIZE,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{600, 0},	
							{600, 1500},
							{0, 1600}
							},
	},				

-- БОЧКА на земле
			{
				texture_name = "graphics/game/skyBlock.png",
				x =BASEMENT + 700,
				y = SEA_LEVEL + 2600,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, 0,0},
							{200, 0, 1,0},	
							{200, 200, 1,1},
							{0, 200, 0,1}
							},
	},

-- БОЧКА на БОЧКЕ
			{
				texture_name = "graphics/game/skyBlock.png",
				x =BASEMENT + 800,
				y = SEA_LEVEL + 2500,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, 0,0},
							{100, 0, 1,0},	
							{100, 100, 1,1},
							{0, 100, 0,1}
							},
	},

-- нижняя земля перед препятствием
			{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT + 900,
				y = SEA_LEVEL + 2800,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0},
							{800, 0},	
							{800, -500},
							{0, -500}
							},
	},	

-- большая воздушная платформа 
		{
				texture_name = "graphics/game/London/balcony.png",
				x =BASEMENT + 600,
				y = SEA_LEVEL + 1850,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, 0,0},
							{600, 0 , 1,0},	
							{600, 30 , 1,1},
							{0, 30 , 0,1}
							},
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},

-- 1 воздушная платформа 
		{
				texture_name = "graphics/game/London/balcony.png",
				x =BASEMENT + 1400,
				y = SEA_LEVEL + 1600,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, 0,0},
							{200, 0 , 1,0},	
							{200, 30 , 1,1},
							{0, 30 , 0,1}
							},
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},

-- 2 воздушная платформа 
		{
				texture_name = "graphics/game/London/balcony.png",
				x =BASEMENT + 1200,
				y = SEA_LEVEL + 1350,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, 0,0},
							{150, 0 , 1,0},	
							{150, 30 , 1,1},
							{0, 30 , 0,1}
							},
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},

-- 3 воздушная платформа 
		{
				texture_name = "graphics/game/London/balcony.png",
				x =BASEMENT + 1400,
				y = SEA_LEVEL + 1120,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, 0,0},
							{150, 0 , 1,0},	
							{150, 30 , 1,1},
							{0, 30 , 0,1}
							},
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
			},


-- БОЧКА на земле
			{
				texture_name = "graphics/game/skyBlock.png",
				x =BASEMENT + 1400,
				y = SEA_LEVEL + 2100,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, 0,0},
							{200, 0, 1,0},	
							{200, 200, 1,1},
							{0, 200, 0,1}
							},
	},

--стекло
			{

				texture_name = "graphics/game/London/glass.jpg",
				x =BASEMENT + 1900,
				y = SEA_LEVEL + 600,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0 , 0,0},
							{50, 0 , 0,1},	
							{50, 300 , 1,1},
							{0, 300 , 0,1}
							},

				takingDamage = function(self)
									self.body:destroy()
									self.fixture:destroy()
									self.draw = DRAW_VOID
									return true
				end, 
	},	

-- потолок в покере
			{

				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT + 1600,
				y = SEA_LEVEL + EARTH_SIZE,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0 , },
							{2880, 0 , },	
							{2880, 600 , },
							{0, 600 , }
							},
	},	

-------- ПОКЕРНАЯ СТЕНА
			{

				texture_name = "graphics/game/skyBlock.png",
				x =BASEMENT + 1600,
				y = SEA_LEVEL + 900,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0 , 0,0},
							{400, 0 , 0,1},	
							{400, 1400 , 1,1},
							{0, 1400 , 0,1}
							},
	},	


-- барчик в покере 

			{
				texture_name = "graphics/game/London/bar.png",
				x = BASEMENT + 1999 + 220, 
				y = SEA_LEVEL + 1600 - 129,
				width = 350,
				height = 5,
				hitbox_ox = 0,
				hitbox_oy = -105,
				init = IMAGE_OBJECT,
				platformEnable = {},
				beginContact = PLATFORM_CONTACT,
				preSolve = PLATFORM_PRE_SLOVE,
				--endContact = PLATFORM_END_CONTACT,
	},





 -- ДИВАНЧИК 
 			{
				texture_name = "graphics/game/London/DIVAN.png",
				x = BASEMENT + 1999 + 600, 
				y = SEA_LEVEL + 1599 - 45,
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









-- пол в покере	
			{
				texture_name = "graphics/game/London/parket.png",
				x =BASEMENT + 2000,
				y = SEA_LEVEL + 1600,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, },
							{3000, 0 , },	
							{3000, 200 ,nil,1 },
							{0, 200 ,0,1 }
							},	
	},





-- крайне правая стенка в покере
			{
				texture_name = "graphics/game/cobble.jpg",
				x =BASEMENT + 4720,
				y = SEA_LEVEL + EARTH_SIZE,
				init = MESH_OBJECT, 
				mode = "fan", 
				vertices = {
							{0, 0, },
							{500, 0 , },	
							{500, 1600 , },
							{300, 1600 , },
							{0,600 , }
							},	
	},




















}
-------------------------------------------------------




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