function getTimeFrame(m) -- получаем таймфрейм из разницы между свечами
-- на вход массив свечей  (см. DS (DataSource))
-- из него получаем две даты свечей
-- кидаем их в сравнение, считаем разницу между свечами.
-- возвращаем интервал
-- подходит для ликвидных инструментов
---

    local sTime = tostring(os.time(m.T[1]))
    local datetime = os.date("!*t", sTime)
    local time1 = StrText(datetime.hour) .. ":" .. StrText(datetime.min) .. ":" .. StrText(datetime.sec) -- возвращаем время в виде HH:MM:SS

    sTime = tostring(os.time(m.T[2]))
    datetime = os.date("!*t", sTime)
    local time2 = StrText(datetime.hour) .. ":" .. StrText(datetime.min) .. ":" .. StrText(datetime.sec) -- возвращаем время в виде HH:MM:SS

    return string.format("%u", diffTime(time2, time1)) -- возвращаем только число без '.0'
end


-- вспомогательные функции --

function diffTime(time1, time2)
-- возвращает разницу в минутах между time2-time1; либо 0, если time1 > time2
-- time1 = "14:00:00"
-- time2 = "14:05:00"
-- result = diffTime(time1, time2) -- = 300 секунд
---

local dt1 = {}
local dt2 = {}
local dTime1 = 0
local dTime2 = 0
local result = 0

    dt1.hour, dt1.min, dt1.sec = string.match(time1,"(%d*):(%d*):(%d*)")
    for key, value in pairs(dt1) do
        dt1[key] = tonumber(value)
    end

    dt2.hour, dt2.min, dt2.sec = string.match(time2,"(%d*):(%d*):(%d*)")
    for key, value in pairs(dt2) do
        dt2[key] = tonumber(value)
    end

    --часы*3600 + минуты*60 + секунды.
    dTime1 = dt1.hour * 3600 + dt1.min * 60 + dt1.sec
    dTime2 = dt2.hour * 3600 + dt2.min * 60 + dt2.sec
    result = (dTime2 - dTime1)

    if result <= 0 then
        return 0
    else
        return result / 60
    end
end

function StrText(int) 
-- добавляем "0" к данным, если число 1 < x < 10
-- возвращает 01, 02, .. , 09. значения типа string
---
    local m = tostring(int)
    local mLen = string.len(int)

    if mLen == 1 then output = "0" .. tostring(m)
    else output = m
    end

    return output
end