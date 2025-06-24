-- Устанавливаем индикатор на график цены (индикатор должен возвращать две линии/треугольники вверх и вниз)
-- Ловим сигнал ботом, выдаём сообщение на экран
---

run = true
idgraf = "CAN" -- ctrl+E на графике цены - выбираем индикатор - дополнительно, ставим идентификатор

function main ()
    while run do
        if Get_signal(idgraf) ~= "" then pse(60) -- если сигнал получен, то чтобы не получать второй раз - пауза в 1 минуту
        else pse(10) -- если сигнал не получен - пауза 10 сек.
        end
    end
end

function OnStop()
    run = false
    msg("Остановлен")
end 

function pse(tSec) -- пауза в секундах
-- ф-ция приостановки
-- данные приводятся к числу
---
    sleep(tonumber(tSec) * 1000)
end

function Get_signal(idgraf)
-- Проверяем график, если ошибок нет, ждём появления сигнала вверх или вниз
-- если сигнал вверх - выдаём сообщение вверх, и наоборот
---

local i = 0
local numOfCandlesG = getNumCandles(idgraf)
        -- msg("getLinesCount1: " .. getLinesCount(idgraf))         -- проверка сколько линий в индикаторе есть для отображения.
        -- msg("numOfCandlesG: " .. tostring(numOfCandlesG))    -- проверка сколько линий в индикаторе есть для отображения.

    if numOfCandlesG == nil or numOfCandlesG == 0 then
        msg("Нет вывода с графика,\nпроверить идентификатор графика индикатора")
        run = false  
    end
        
    local priceRed, priceGreen -- получение данных с двух линий графика (считается от нуля)
    for i = 0, 1 do --0 - это значения зеленых меток, 1 - это значения красных меток индикатора.
        local t, _, _ = getCandlesByIndex(idgraf, i, numOfCandlesG - 1, 1) -- получаем массив данных с текущей в данный момент свечи
        if i == 0 then 
            priceGreen = t[0].low -- если получен сигнал с 1 линии индикатора - это для входа в лонг
            break
        elseif i == 1 then 
            priceRed = t[0].high -- если получен сигнал со 2 линии индикатора - это для входа в шорт
            break
        end
    end
        -- проверка получаемых данных
        -- msg("priceRed = "  .. tostring(priceRed))
        -- msg("priceGreen = "  .. tostring(priceGreen))    

    if priceGreen ~= nil and priceGreen ~= 0 then 
        msg("UP, sl = " .. tostring(priceGreen))
        return "up"
    elseif priceRed ~= nil and priceRed ~= 0 then 
        msg("DOWN, sl = " .. tostring(priceRed))
        return "down"
    else return ""
    end
end

function msg(txt) -- сообщение
-- ф-ция вывода сообщений
-- данные приводятся к строке, выводится сообщение с треугольником '!'
---
    message(tostring(txt), 2)
end