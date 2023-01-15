-------------------------------------------------------------------------------------------------------
--- Функция получения результатов свечей в .CSV в виде:
--- <Инструмент> <Дата> <Время> <Цена_Open> <Цена_High> <Цена_Low> <Цена_Close> <Объем>
--- BRN0	1	20200605	200100	42.15	42.16	42.1	42.1	2150
-------------------------------------------------------------------------------------------------------
is_run = true

-- Параметры
tInstr = "BRZ3" --код инструмента/бумаги
classcode = "SPBFUT" --код класса инструмента/бумаги, если нужен фондовый рынок - вводить TQBR вместо SPBFUT
iNterval = INTERVAL_M1 --таймфрейм
-- доступные таймфреймы указаны в справке Quik (qlua.chm в папке с quik) по поиску CreateDataSource
-- пример INTERVAL_H1
corrTime = 3 --Время МСК. C сервера время приходит без корректировки.
pFile = "d:\\temp" --путь, где будет создаваться файл
cBars = 10 --сколько свечей надо вывести


--инициализация
function OnInit()
	out_file = io.open(pFile .."\\"..tostring(tInstr)..".csv","w")
	is_run = (out_file ~= nil)
	ds = CreateDataSource(classcode, tInstr, iNterval ) --создаем источник данных для получения свечей
	ds:SetUpdateCallback(NewChartData) --обновление последних данных
end

function strText(int)
	local m = tostring(int)
	local mLen = string.len(int)

	if mLen == 1 then Output = "0" .. tostring(m)
	else Output = m
	end
	return Output
end

-- основной цикл программы
function main()
	while is_run do
	local Size = ds:Size() --Получение количества всех свечей в источнике данных

	if cBars > Size then cBars = Size - 1
	end

	for i = Size - cBars, Size, 1 do
		local O = ds:O(i) -- Значение цена открытия свечи
		local H = ds:H(i) -- Значение High для свечи
		local L = ds:L(i) -- Значение Low для свечи
		local C = ds:C(i) -- Значение Close для свечи
		local V = ds:V(i) -- Значение Volume для свечи
		local T = ds:T(i) -- Значение Time для свечи

		sTime = os.time(T)
		datetime = os.date("!*t",sTime)

		--вывод в файл
		out_file:write(tInstr .. ";" .. tostring(iNterval) .. ";"
			.. tostring(datetime.year) .. tostring(strText(datetime.month))
			.. tostring(strText(datetime.day)) .. ";" .. tostring(strText(datetime.hour + corrTime))
			.. tostring(strText(datetime.min)) .. tostring(strText(datetime.sec)) ..";"
			.. tostring(O) .. ";" .. tostring(H) .. ";" .. tostring(L) .. ";" .. tostring(C) ..";"
			.. tostring(V) .. "\n")

		out_file:flush() --запись данных
	end
		out_file:close()
		sleep(1000)   -- приостановка на 1 секунду
		out_file = io.open(pFile .. "\\" .. tostring(tInstr) .. ".csv","w")
	end
end
