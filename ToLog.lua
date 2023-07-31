--[[ -- для теста убрать скобки

SEC_CODE = "BRU3"   -- код инструмента
Log = ""            -- имя файла для записи лога, можно задать по-умолчанию в формате "c:\log.csv", либо в потоке main ниже

function main()
Log = getScriptPath() .. "\\include\\" .. SEC_CODE .. "_log.csv" -- файл лога складывается в папку с луаиндикаторами\include\BRU3_log.csv

ToLog("Test message") -- пример использования
end
--]]

function Tolog(comment)
-- функция логгирования данных
-- Log - глобальная. имя файла для записи
-- SEC_CODE - глобальная, код инструмента
-- comment - комментарий для записи в файл
---

    local CSV = io.open(Log, "a+")
    local position = CSV:seek("end", 0)

    if position == 0 then
        local header = "Дата;Инструмент;Комментарий\n"
        CSV:write(header)
        CSV:flush()
        position = CSV:seek("end", 0)
    end

    if Position ~= 0 then -- идём в последнюю строку csv файла
        local txt = tostring(os.date()) .. ";" .. SEC_CODE .. ";" .. tostring(comment) .. ";" .. "\n"
        CSV:write(txt)  -- Добавляет строку результатов в файл
        CSV:flush()     -- Сохраняет изменения в файле
        CSV:close()     -- закрываем файл
    else
        --message("Ошибка создания файла ")
    end
end