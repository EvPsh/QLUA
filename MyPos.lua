function MyPos(account, seccode)
-- Определение текущей позиции по инструменту seccode счета account
-- Использование: отправляем транзакцию, затем сверяем количество лотов с заявкой, 
-- если равны, значит позиция набрана.
-- Применяется для сверки: все ли заявки исполнены.
--- 

	local numS = getNumberOf("futures_client_holding")
	local i = 0
	if (numS ~= nil) then
		for i = 0, numS - 1 do
			local row = getItem("futures_client_holding", i)
			if (row ~= nil and row.sec_code == seccode and row.trdaccid == account) then
				return tonumber(row.totalnet)
			end
		end
	end
	return 0
end
