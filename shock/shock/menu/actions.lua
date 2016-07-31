
function DO_NOTHING(self)end

---------------MAIN MENU --------------------

function NEW_GAME(self)
	menu.destroy()
	IN_PROCESS  = game.load()
	
end


function LOAD_GAME(self)
	
end

function GO_TO_OPTIONS(self)
	IN_PROCESS = menu.load("option_menu")
end

function EXIT(self)
	love.event.quit()
end
--------------------------------------------

 ---------------PAUSE MENU ------------------
function CONTINUE(self)
	menu.destroy()
	IN_PROCESS = game
	
end

function GO_TO_MAIN_MENU(self)
		game.destroy()
		IN_PROCESS = menu.load("main_menu")
end
---------------------------------------------

-------------OPTION_MENU---------------------
function GO_TO_GRAPHICS(self)
	menu.load("graphics_options")
end

function GO_TO_SOUNDS(self)

end

function GO_TO_CONTROLS(self)

end

function GO_BACK(self)
	IN_PROCESS = menu.load(menu.previous())
end


--------------GRAPHICS_OPTION------------------

function CHANGE_FULLSCREEN(self)
	options.graphics.fullscreen = not options.graphics.fullscreen
	love.window.setMode(options.resolution.w, options.resolution.h, options.graphics)
end

function RESOLUTION_REDUCE(self)
	options.changeResolution(false)
end

function RESOLUTION_INCREASE(self)
	options.changeResolution(true)
end