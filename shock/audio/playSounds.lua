sounds  = { }

function playSoundBG(music_path, type)
	if music_path == nill then 
		love.audio.stop() 
		return
	end
	if sounds[music_path] == nil then 
		sounds[music_path] = love.audio.newSource(music_path, type)
		sounds[music_path]:setLooping(true)
	end
	love.audio.play(sounds[music_path])

end

function playSound(music_path, type)

	--if sounds[music_path] == nil then 
	--	sounds[music_path] = love.audio.newSource(music_path, type)
	--	love.audio.play(sounds[music_path])
	--end
	--if sounds[music_path]:isPlaying() then love.audio.rewind(sounds[music_path]) end
	if sounds[music_path] ~= nil then 
		love.audio.stop(sounds[music_path])
	end
	sounds[music_path] = love.audio.newSource(music_path, type)
	love.audio.play(sounds[music_path])

	--if sounds[music_path] ~= nil then  
    --	if sounds[music_path]:isStopped() then 
    --		love.audio.play(sounds[music_path])
    --	end 
    --else 
    --	sounds[music_path] = love.audio.newSource(music_path, type)
    --	love.audio.play(sounds[music_path])
	--end
end