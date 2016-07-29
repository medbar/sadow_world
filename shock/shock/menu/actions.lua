
---------------MAIN MENU --------------------

function NEW_GAME()
	menu.destroy()
	IN_PROCESS  = game.load()
	
end


function LOAD_GAME()
	
end

function GO_TO_OPTIONS()
	IN_PROCESS = menu.load("option_menu")
end

function EXIT()
	
end
--------------------------------------------

 ---------------PAUSE MENU ------------------
function CONTINUE()
	menu.destroy()
	IN_PROCESS = game
	
end

function GO_TO_MAIN_MENU()
		game.destroy()
		IN_PROCESS = menu.load("main_menu")
end
---------------------------------------------

-------------OPTION_MENU---------------------
function GO_TO_GRAPHICS()
	
end

function GO_TO_SOUNDS()

end

function GO_TO_CONTROLS()

end

function GO_BACK()
	IN_PROCESS = menu.load(menu.previous())
end