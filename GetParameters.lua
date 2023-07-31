--[[ -- для теста убрать скобки
function main()
-- использование: на графике цены жмём ctrl+E, слева выбираем график цены (... [Price]) -> справа выбираем вкладку "дополнительно" ->
-- > Идентификатор -> к примеру IDG
---
    local IdGraf = "IDG" -- уточняем с какого графика необходимо получить параметры
    local classcode, seccode, bars, price_step = GetSeccode(IdGraf) -- получаем параметры с графика
    if classcode == nil then 
            message("Проверить метку " .. tostring(IdGraf) .. " на графике")
        OnStop()
        return 
    else
            message("classcode " .. tostring(classcode))    -- выводим код класса графика с идентификатором "IDG"
            message("seccode " .. tostring(seccode))        -- выводим код инструмента графика
            message("price_step " .. tostring(price_step))  -- выводим шаг цены инструмента графика
            for k, v in pairs(bars) do                      -- выводим данные OHLCVT последнего бара (1-ый справа)
                message("K = " .. tostring(k) .." / v = ".. tostring(v))
            end
    end

end
--]]

function GetParameters(idgraf)
-- Получаем данные по легенде графика str
-- Получаем sec_code с графика цены
-- возвращаем string class_code, string sec_code, table t (таблица OHLCVT последнего бара (1ый справа)), price_step
-- использование:
--[[
    local classcode, seccode, bars, price_step = GetSeccode(IdGraf)
    if classcode == nil then 
            message("Проверить метку " .. tostring(IdGraf) .. " на графике")
        OnStop()
        return 
    else
            message("classcode " .. tostring(classcode))
            message("seccode " .. tostring(seccode))
            message("price_step " .. tostring(price_step))
            for k, v in pairs(bars) do
                message("" .. tostring(k) .." / ".. tostring(v))
            end
    end
--]]
--- 

    local lastbar = getNumCandles(idgraf) -- получаем номер последнего бара (1ый справа)
    local t, _, legend = getCandlesByIndex(idgraf, 0, lastbar - 1, 1) -- получаем данные бара (таблицу OHLCVT, легенду графика). lastbar - 1 - потому что считаем от 0 до n - 1.

    legend = string.sub(legend, 1, -9) -- обрезка " [Price]" в легенде графика

    local txt = "securities" -- перебираем таблицу с инструментами
    local n = getNumberOf(txt) -- получаем количество инструментов
    for i = 0, n - 1 do
        local data = getItem(txt, i)
        if data.short_name == legend then
            -- data.class_code ->       classcode
            -- data.sec_code ->         seccode
            -- t[0] ->                  OHLCVT (.open, .close, .high, .volume, . datetime --{})
            -- data.min_price_step ->   price_step      

            return data.class_code, data.sec_code, t[0], data.min_price_step
            -- break
        end
    end
    return nil
end