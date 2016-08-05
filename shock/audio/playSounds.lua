soundBG = nil

function playSound(menu_type)
  if menu_type == "main_menu" then
    soundBG = love.audio.newSource("audio/menu/menu_sound.mp3", "stream")
    love.audio.play(soundBG)
  end
  
  -- TODO Сделать для остальных типов меню
end