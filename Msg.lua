--[[ -- для теста убрать скобки
function main()
-- использование:
---

    msg("Проверка использования")

end
--]]

function msg(txt) -- сообщение
-- ф-ция вывода сообщений
-- данные приводятся к строке, выводится сообщение с треугольником '!'
---
    message(tostring(txt), 2)
end
