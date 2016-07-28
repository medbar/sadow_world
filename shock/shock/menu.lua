-- нямнбмни йкюяя дкъ мехцнбнцн опнжеяяю 
--

require "menu/actions"


MENU_SCRIPTS_PATH = "menu/"

menu = {}

function menu.load(menu_type)
	menu.elements = {}
	menu.textures = {}
	menu.background = love.graphics.newImage("graphics/menu/bg_"..menu_type..".png")

	if menu_type == "options" then 
		return require(MENU_SCRIPTS_PATH .. menu_type)
	end
	menu.elements = require(MENU_SCRIPTS_PATH .. menu_type)

	INIT_COLLECTION(menu,"elements")

	menu.focus = 0 -- botton in focus index


	return menu 
end


function menu.update(dt)
	--options.resolution.x =  650
	--fWINDOW_HEIGHT = ff
	local mX = love.mouse.getX()
	local mY = love.mouse.getY()
	menu.focus = 0
	for i,b in ipairs(menu.elements) do
	if math.abs(mX - b.x*options.resolution.x) < menu.textures[b.texture_name]:getWidth() and
	  math.abs(mY - b.y*options.resolution.y) < menu.textures[b.texture_name]:getHeight() 
	  then
		menu.focus = i
		break
	  end
	end
end

function menu.draw()	
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(love.graphics.newFont(15))
	love.graphics.draw(menu.background,0,0,0,
							options.resolution.x / menu.background:getWidth(),
							options.resolution.y / menu.background:getHeight())

	for i,b in ipairs(menu.elements) do 
	
		if i == menu.focus then
			love.graphics.setColor(120,120,120)
		else 
			love.graphics.setColor(255,255,255)
		end
		
		b:draw(menu.textures)
		love.graphics.setColor(208,36,140)
		love.graphics.print(b.text,
							b.x*options.resolution.x - menu.textures[b.texture_name]:getWidth() / (3*i), 
							b.y*options.resolution.y - menu.textures[b.texture_name]:getHeight() / 4)				
	end
end

function menu.mousereleased(x,y,botton)
	if  menu.focus ~=0 then 
		menu.elements[menu.focus].action()	
	end
end





function menu.destroy()
	menu.elements = nil
	menu.textures = nil
	menu.background = nil
end