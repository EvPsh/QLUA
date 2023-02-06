-- инициализация DataSource -----------------------------------------
DS = nil
function OnInit()
    --инициализация
    local Error = ""
    DS, Error = CreateDataSource(CLASS_CODE, SEC_CODE, INTERVAL_M1)
    -- проверка
    if DS == nil then
        message("Ошибка доступа к данным!\n" .. Error)
        return
    end
end

function main()
	local now = DS:Size() -- последняя (текущая) свечка с ценами №, number
	local abTime = RetTimeDS(DS, now)

	message(abTime)

end

function OnStop()
    DS:Close()
end



function RetTimeDS(ds, s)
-- ds - DataSource для свечей
-- s - данные, для которых необходимо получить время DS:Size()
-- {year, month, day, week_day, hour, min, sec, ms, count} 
-- возврат времени в формате "ЧЧ:ММ:СС"
-- если ошибка - возвращает "00:00:00"
---
    local tmeds = ds:T(s)
    if tmeds ~= nil then
        local stme = StrText(tmeds.hour) .. ":" .. StrText(tmeds.min) .. ":" .. StrText(tmeds.sec)
        return stme
    else return "00:00:00"
    end
end