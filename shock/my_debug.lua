

									 
function DEBUG_UPDATE()
	DEBUG_INFO = "debug info:\n"
	if IN_PROCESS == game then
		DEBUG_INFO = DEBUG_INFO..player.body:getX() .. ", "..player.body:getY() .. "\n"
		DEBUG_INFO = DEBUG_INFO ..player.body:getAngle().."\n"
		DEBUG_INFO = DEBUG_INFO ..[[		HEALTH: ]]..player.hp.."\n"
		
	elseif IN_PROCESS == menu then 
		for i,h in ipairs(menu.history) do
			DEBUG_INFO = DEBUG_INFO..h.." "
		end
		DEBUG_INFO = DEBUG_INFO.."\n"
	end
end


function DEBUG_DRAW()
	love.graphics.push()
	love.graphics.origin()
	love.graphics.print(DEBUG_INFO,10,10)
	love.graphics.pop()
end
