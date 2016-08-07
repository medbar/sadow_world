sounds  = { }

function playSoundBG(music_path, menu_type)
	if menu_type == "pause_menu" then 
		sounds[music_path]:stop() 
		return
	end
  
	if sounds[music_path] == nil then 
		sounds[music_path] = love.audio.newSource(music_path, "stream")
		sounds[music_path]:setLooping(true)
	end
  
	sounds[music_path]:play()
end


function playSound(music_path, type)
	if sounds[music_path] ~= nil then 
		love.audio.stop(sounds[music_path])
	end
  
	sounds[music_path] = love.audio.newSource(music_path, type)
	love.audio.play(sounds[music_path])
end