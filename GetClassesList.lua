function main()
-- Справочная информация:
-- Вывод списка классов Quik
-- вывод инструментов класса
-- вывод справочных данных о классе в формате ключ(поле таблицы) = значение
-- вывод информации об инструменте в формате ключ(поле таблицы) = значение
---

local list = getClassesList() 
	message("list: \n" .. tostring(list))

local sec_list = getClassSecurities("SPBFUT") -- вывод инструментов класса SPBFUT (Sec_code)
	message("Sec_list: \n" .. tostring(sec_list))

local tInstr = {}
tInstr = getClassInfo("SPBFUT") -- вывод справочной информации из класса SPBFUT
	for key, v in pairs (tInstr) do
	   message(tostring (key) .. " = " .. tostring(v), 1)
	end

local info = {}
info = getSecurityInfo("SPBFUT", "RMH3") -- вывод информации об инструменте RMH3 из класса SPBFUT
	for key, v in pairs(info) do
	   message(tostring (key) .. " = " .. tostring(v), 2)
	end
end