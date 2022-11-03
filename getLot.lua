function getLot(classcode, seccode, ltPercent)
	-- Функция получения возможного количества лотов,
	-- исходя из ГО и средств на счёте. возвращает числовое значение
	-- ltPercent = 100 -- использовать все свободные средства на счёте под торговлю фьючерсами.

	local lbuy = tonumber(getParamEx(classcode, seccode, "BUYDEPO").param_value) -- ГО покупателя
	local lsell = tonumber(getParamEx(classcode, seccode, "SELLDEPO").param_value) -- ГО продавца
	local fMoney = getItem("futures_client_limits", 0).cbplimit -- вот здесь может быть ошибка (соединение установлено, но данные с сервера ещё не подгружены, получаем ошибку)

	-- расчёт лота исходя из максимального ГО для инструмента.
	if fMoney == 0 or fMoney == "" or fMoney == nil then -- если данные по свободным средствам не получены
		return 0
	else
		if lbuy <= lsell then lot = round(fMoney * ltPercent / 100 / lsell, 0)
		else lot = round(fMoney * ltPercent / 100 / lbuy, 0)
		end
		return lot
	end
end

function round(number, znaq) -- функция округления числа num до знаков znaq.
local num = tonumber(number)
local idp = tonumber(znaq)

	if num then
		local mult = 10 ^ (idp or 0)
		if num >= 0 then return math.floor(num * mult + 0.5) / mult
		else return math.ceil(num * mult - 0.5) / mult
		end
	else return num
	end
end
