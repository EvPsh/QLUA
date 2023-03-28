function DaysToDie(class_code, sec_code)
	-- Получаем количество дней до погашения инструмента,
	-- если < 4, просим заменить инструмент
  -- для работы необходима ф-ция из Round.lua
  -- is_run - глобальный флаг работы робота - false = отключаемся.
	---

	local daysToDie = 0 -- количество дней до погашения инструмента
	---------------------------------- получаем количество дней до погашения, если < 4, рекомендуем перейти на новый инструмент ----------
	daysToDie = round(getParamEx(class_code, sec_code, "DAYS_TO_MAT_DATE").param_value, 0)
	if daysToDie <= 4 and daysToDie > 0 then
		message("Количество дней до погашения инструмента " .. sec_code .. " равно " .. tostring(daysToDie) .. ". Необходимо заменить инструмент в настройках робота")
	elseif	daysToDie == 0 or daysToDie == nil then
		message("Инструмент больше не торгуется")
		is_run = false
	end
	return daysToDie
end
