-- Скрипт выводит средние значения "хвостов" цены и цены за num количество свечей графика:
-- на падающей свече - High-Low, Close-Low, Open-Close, High-Low; 
-- на растущей свече - Open-Low, High-Close, Close-Open, High-Low. 
-- Можно использовать для проверки средней цены разброса

-- Необходимо установить метку на графике цены
-- Необходимо указать код инструмента и код класса инструмента
-- Необходимо указать количество свечей для подсчета среднего
---

function main()
 ---------------------------- меняем только здесь ----------------------------------------------------
local CLASS_CODE = "SPBFUT"      -- код класса, менять нужно, если торговля будет не фьючерсами 
local SEC_CODE = "BRH4"          -- инструмент 
local num = 60                   -- вывести средние значения за 60 последних свечей
local idgraf = "BRH"             -- метка графика цены (ctrl + E на графике, выбираем 'price', дополнительно, ставим в поле 'идентификатор')
------------------------------------------------------------------------------------------------------

-- Вызов функции для отображения разницы цен
mes(CLASS_CODE, SEC_CODE, idgraf, num)

end

function mes(class_code, sec_code, idgraf, numCandles)
    local numOfCandlesG = getNumCandles(idgraf)
    local HCHO = 0
    local COOC = 0
    local OLCL = 0
    local HLHL = 0

    for index = numOfCandlesG - 2, numOfCandlesG - 2 - numCandles, -1 do
        local t, _, _ = getCandlesByIndex(idgraf, 0, index, 1)
        -- for k, v in pairs(t[0]) do
        --     message(tostring(k) .. " = "..tostring(v))
        -- end

        if t[0].doesExist == 1 then 
            if t[0].open - t[0].close > 0 then -- если падающая свеча
                HCHO = HCHO + t[0].high - t[0].open
                COOC = COOC + t[0].open - t[0].close
                OLCL = OLCL + t[0].close - t[0].low
                HLHL = HLHL + t[0].high - t[0].low

            elseif t[0].open - t[0].close < 0 then -- если растущая свеча
                HCHO = HCHO + t[0].high - t[0].close
                COOC = COOC + t[0].close - t[0].open
                OLCL = OLCL + t[0].open - t[0].low
                HLHL = HLHL + t[0].high - t[0].low
            end
        end
    end
    HCHO = round(HCHO, 2)
    COOC = round(COOC, 2)
    OLCL = round(OLCL, 2)
    HLHL = round(HLHL, 2)

    message("High-Open (High-Close) = " .. tostring(HCHO) ..
            "\nClose-Open (Open-Close) = " .. tostring(COOC) ..
            "\nOpen-Low (Close-Low) = " .. tostring(OLCL) ..
            "\n\nHigh-Low (High-Low) = " .. tostring(HLHL)
            )
end

function round(number, znaq) -- функция округления числа num до знаков znaq
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

