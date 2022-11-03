function comma(what)
	-- функция меняет '.' на ',' в what и возвращает текстовое значение
	-- используется в csv для получения правильного числа (пример 50.50 -> 50,50)
	---
	local xstr = string.gsub(tostring(what), "%.", ",")
	return tostring(xstr)
end
