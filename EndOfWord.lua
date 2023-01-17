function EndOfWord(n, txt)
-- ф-ция добавляет окончание слова
-- n - число, number
-- txt - текст, которому нужно добавить окончание, string
-- использование: str = EndOfWord(22, "сигнал") -> str = "22 сигнала"
---

local en1 = ""
local en2 = "а"
local en3 = "ов"
local ntxt = tostring(n) .. " "
    if n == 1 then return ntxt .. txt .. en1
    elseif (n >= 2 and n <= 4) then return ntxt .. txt .. en2
    elseif (n == 0 or n >= 5 and n <= 20) then return ntxt .. txt .. en3
    end 

    if (n > 20 and n <= 100) then
        local z = n % 10
        if (z == 0 or z >= 5 and z <= 9) then return ntxt .. txt .. en3
        elseif (z == 1) then return ntxt .. txt
        elseif (z >= 2 and z <= 4) then return ntxt .. txt .. en2
        end
    else return "> 100 " .. txt .. en3 -- обработка количества больше ста.
    end
end