function getTimeframe (id) -- получение таймфрейма с графика
-- Получаем таймфрейм с графика с меткой
-- id - идентификатор/метка графика (выставляется в настройках графика цены)
---
local bars = getCandlesByIndex(id, 0, 0, getNumCandles(id) - 1)

    if bars then
        
        for i, _ in pairs(bars) do
            bars[i] = os.time(bars[i].datetime)
        end

        for i = 2, #bars do
            bars[i - 1] = bars[i] - bars[i - 1]
        end
        
        return math.min(unpack(bars))
    end
    return nil -- если данных не получено, возвращаем nil
end