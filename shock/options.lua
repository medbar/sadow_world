options = {}


options.resolutionsTable = {
							{w = 1024, h = 768 },
							{w = 1152, h = 864 },							
							{w = 1280, h = 800 },
							{w = 1280, h = 1024 },
							{w = 1366, h = 768 },							
							{w = 1440, h = 900 },
							{w = 1600, h = 900 },
							{w = 1680, h = 1050 },
							{w = 1920, h = 1080 }
}


function options.load()
	-- в идеале надо сделать загрузку из файла, но пока что в лоаде будет формирование новых настроек
	if OPTION_FILE then 
		--не существующий блок кода
		options.loadFromFile()
	else
		options.generateNew()
	end
end


function options.save()

end


function options.changeResolution(increase)
	if increase then 
		if options.resolutionId < #options.resolutionsTable then
			options.resolutionId = options.resolutionId + 1
			options.resolution.w = options.resolutionsTable[options.resolutionId].w
			options.resolution.h = options.resolutionsTable[options.resolutionId].h
		end
	else
		if options.resolutionId > 1 then
			options.resolutionId = options.resolutionId - 1
			options.resolution.w = options.resolutionsTable[options.resolutionId].w
			options.resolution.h = options.resolutionsTable[options.resolutionId].h
		end
	end
  
	love.window.setMode(options.resolution.w, options.resolution.h,options.graphics)
end


function options.generateNew()
	-- SOUNDS --
	options.sound = {
						Vmusic = 100,
						Veffects = 100,
						speech = 100
					}
	------------

	-- GTRAPHICS -- 
	options.resolutionId = 1
	options.graphics = {
						fullscreen = false,
						resizable  = true,
						fullscreentype = "desktop",
						highdpi = true,
						}
	
	options.resolution =  {
						  w = options.resolutionsTable[options.resolutionId].w,
						  h = options.resolutionsTable[options.resolutionId].w
						  }
	---------------

	-- CONTROLS --
	options.controls = {
						left = "a",
						right = "d",
						up = "w",
						down = "s",
						jump = "space",
						attack = "k",
						pause = "escape",

						setKey =  function(name, key)									
									for nm, k in pairs(options.controls) do
										if key == k then 
											options.controls[nm] = "?-?"
											options.controls[name] = key
											return
										end
									end
									options.controls[name] = key
								 end
						}
	--------------
end