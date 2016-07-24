
MENU_SCRIPTS_PATH = [[menu/]]

menu = {}

function menu.load(menu_type)
	menu.bottons = {}

	menu.bottons = require(MENU_SCRIPTS_PATH .. menu_type)

	for i,b in ipairs(menu.bottons) do 
		b.image = love.graphics.newImage(b.texture_name)
	end 

	menu.focus = 0 -- botton in focus index
	love.graphics.setBackgroundColor(104, 136, 248) --blue
end


function menu.update(dt)
	WINDOW_WIDTH =  650
	fWINDOW_HEIGHT = ff
	local mX = love.mouse.getX()
	local mY = love.mouse.getY()
	menu.focus = 0
	for i,b in ipairs(menu.bottons) do
	if math.abs(mX - b.x*WINDOW_WIDTH) < b.image:getWidth() and
	  math.abs(mY - b.y*WINDOW_HEIGHT) < b.image:getHeight() 
	  then
		menu.focus = i
		break
	  end
	end
end

function menu.draw()	
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(love.graphics.newFont(15))

	for i,b in ipairs(menu.bottons) do 
	
		if i == menu.focus then
			love.graphics.setColor(120,120,120)
		else 
			love.graphics.setColor(255,255,255)
		end
		love.graphics.draw( b.image ,
							b.x*WINDOW_WIDTH -  b.image:getWidth() / 2 ,
							b.y*WINDOW_HEIGHT - b.image:getHeight() / 2)
		love.graphics.setColor(208,36,140)
		love.graphics.print(b.text,
							b.x*WINDOW_WIDTH -  b.image:getWidth() / (3*i), 
							b.y*WINDOW_HEIGHT - b.image:getHeight() / 4)				
	end
end

function menu.mousereleased(x,y,button)
	if  menu.focus ~=0 then 
		CHANGE_STATE(menu.bottons[menu.focus].action)
		
	end
end
