function IsFileExists(file)
-- Функция проверки существования файла
-- true - если есть, false - если нет.
---
	local f = io.open(file)
	if f ~= nil then io.close(f) return true 
	else return false end
end