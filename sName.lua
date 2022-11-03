function sName()
-- Получение имени запущенного скрипта
---
local scName -- имя запущенного скрипта

	scName = string.match(debug.getinfo(1).short_src, "\\([^\\]+)%.lua$") -- получение имени запущенного скрипта
	return scName
end
