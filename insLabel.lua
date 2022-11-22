--[[
function main()
-- Тест для проверки
-- Идентификатор графика - qtl, дату, время и цену проставить нужную с графика
-- устанавливаем метку, ждём 3 сек, удаляем все метки с графика.
---
    insLabel ("qtl", 0, "20221122", "214233", "8.510")
    sleep(3000)
    DelAllLabels("qtl")
end
--]]

function insLabel (idnt, lType, lDate, lTime, y)
-- Ф-ция установки метки на графике
-- idnt идентификатор графика
-- lType - 1, -1, 0. Покупка, продажа, другой сигнал
-- lDate - дата в формате YYYYMMDD (string)
-- lTime - время в формате HHMMSS (string)
-- y - ставим метку на уровне цены
---

local lParams = {}
    if lType == 1 then lParams.IMAGE_PATH = getScriptPath() .. "\\buy.bmp"
    elseif lType == -1 then lParams.IMAGE_PATH = getScriptPath() .. "\\sell.bmp"
    elseif lType == 0 then
        --lParams.IMAGE_PATH = getScriptPath() .. "\\0.bmp"
    end

    lParams.DATE = lDate
    lParams.TIME = lTime

    lParams.YVALUE = y
    lParams.ALIGNMENT = LEFT -- LEFT, RIGHT, TOP, BOTTOM
    lParams.FONT_FACE_NAME = "Arial"
    lParams.FONT_HEIGHT = 10

    lParams.R = 255 -- цвет по умолчанию "белый"
    lParams.G = 255
    lParams.B = 255

    lParams.TRANSPARENT_BACKGROUND = 0 -- Прозрачность фона. «0» – отключена, «1» – включена

    lParams.TEXT = "Просто текст"
    lParams.HINT = "Это всплывающая подсказска"

    AddLabel(idnt, lParams)
end
