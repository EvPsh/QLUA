function pattern ()
	local pattern = false
	if pattern = true then
		--
		-- здесь разбор паттерна, если совпадает, то возвращаем true
		--
		return true
	else
		return false
	end
	
	--[[
	-- сделать либо require pattern.lua, либо dofile pattern.lua
	while (false) do
		pattern()
		-- как только pattern вернёт true -> выход из цикла
	end
	--]]

end