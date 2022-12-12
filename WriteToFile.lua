function main()
	local header = "Инструмент;Таймфрейм;Сигнал;Дата;Время;\n" 
	-- \n - перенос строки, иначе первую строку после заголовка допишет справа, а не с новой строки
	nFile = "c:\\temp.csv"
	t_id = nil -- вместо nil необходимо передать уже созданную таблицу с необходимыми результатами

	WriteToFile(nFile, t_id, header) -- использование ф-ции

end

function WriteToFile(nfile, t_id, header)
-- Ф-ция записи в файл данных таблицы с заголовком
-- nfile - файл для записи
-- t_id - идентификатор таблицы, которую нужно сохранить
-- header - заголовок в файле
-- файл будет дозаписываться.

-- используется ф-ция GetTableSize. В документации не указано:
-- для перебора массивом: i - номер строки (начинается с 1, заголовок не входит) до n
-- j - номер колонки, начинается с "0", до m - 1 (к примеру колонок 5, значит перебор с 0 до 4х)
---
 
    local CSV = io.open(nfile, "a+")
    local position = CSV:seek("end", 0)
	local txt = "" --для вывода в файл
    
    if position == 0 then -- обработка ошибки пустого файла
		CSV:write(header) -- пишем заголовок, если файл не был ранее создан
		CSV:flush() -- пишем изменения в файл
		position = CSV:seek("end", 0) -- устанавливаем в конец
	end

    local rows, col = GetTableSize(t_id) -- номер строки с 1 до x, номер колонки с 0 до n-1 (!!!)
    
    if rows ~= 0 then
        for i = 1, rows do -- номер строк с "1"
            for j = 0, col - 1 do -- номер колонок с "0" до m - 1
                txt = txt .. tostring(GetCell(t_id, i, j).image) .. ";" -- .image - это строковое значение, .value - это number
            end            
            txt = txt .. "\n"
            CSV:write(txt)
            txt = "" -- обнуляем строку, пишем следующий ряд в файл
        end
        CSV:flush()
        CSV:close()
    end 
end