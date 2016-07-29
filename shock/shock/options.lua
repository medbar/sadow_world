options = {}

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

function options.generateNew()

	-- SOUNDS --
	options.sound = {
						Vmusic = 100,
						Veffects = 100,
						speech = 100
					}
	------------

	-- GTRAPHICS -- 
	options.graphics = {
						fullscreen = false,
						resizable  = true,
						}
	options.resolution = {
						x = 1200,
						y = 700,
					
						}
	---------------

	-- CONTROLS --
	options.controls = {
						left = "left",
						right = "right",
						jump = "space",
						attack = "k",
						pause = "escape"
						}
	--------------
end


 