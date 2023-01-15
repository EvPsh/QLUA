function StrText(int) 
-- добавляем "0" к данным, если число 1 < x < 10
-- возвращает 01, 02, .. , 09. значения типа string
-- используется для работы со временем, 
-- пример, при переводе времени 17:09:00 в number, вернётся:
-- 17, 9, 0. чтобы работать с временем, как с текстом, нужна эта ф-ция
---
    local m = tostring(int)
    local mLen = string.len(int)

    if mLen == 1 then output = "0" .. tostring(m)
    else output = m
    end

    return output
end

