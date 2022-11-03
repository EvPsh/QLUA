function stopDayProfit(res, what, sprof)

-- stopDayProfit (Результат, "несгораемая" сумма, отступ для трейлинг стопа)
-- ф-ция trailing stop для робота-скальпера. Если робот набирает в плюс, делаем trailing для полученного результата и ограничиваем возможную просадку.
-- res - количество ticks (текущий результат)
-- what - количество ticks "несгораемая сумма", what превышает result, начинаем следить (триггер срабатывания trailing)
-- sprof - это размер trailing stop для результата (держим "несгораемую сумму" в размере sprof от результата)
--
-- используются глобальные (использовать в теле main()):
-- StopDayTrade -  текущее значение результата (в ticks)
-- RTicks - "несгораемая" сумма
-- TRoffset - отступ от RTicks
-- is_run - boolean. Флаг остановки робота is_run == true - работаем, false - остановка робота.
--
---
	
	-- для Brent stopProfit(result, 100, 50)
  -- робот добивает result до +100 ticks (~ +600 р. на один лот), выставляется стоп на +50 ticks, если результат будет ниже = stopTrade. 
  -- Если результат будет выше, стоп подтягивается и держится в 50 ticks от результата.

	local newstop = -what
	local multiplier = math.floor(res / what)

	-- диапазон -what -------- 0 -------- what -------- multiplier * what, 
	-- ищем новый стоп
	if res <= -what then -- если упали ниже лимита (<-what)
		message("Лимит потерь на день исчерпан")
		is_run = false	
	elseif res > -what and res < what then newstop = -what -- -what - what
	elseif res >= multiplier * what then newstop = res - sprof
	end
	
	-- ставим новый стоп, если результат стал больше, если результат меньше - ничего не делаем
	if newstop > StopDayTrade then 
		StopDayTrade = newstop
	end

	-- проверка если результат стал меньше trailing стопа - останавливаем
	if res <= StopDayTrade then
		message("Сработал StopDayTrade.\nс результатом = " .. res)
		is_run = false
	end

end
