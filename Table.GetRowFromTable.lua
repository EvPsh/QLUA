function GetRowFromTable(t_id, key, value)
-- Получаем номер строки по номеру
---
	local i
	for i = getNumberOf(t_id) - 1, 0, -1 do
		if getItem(t_id,i)[key] == value then
			return getItem(t_id, i)
		end
	end
	return nil
end