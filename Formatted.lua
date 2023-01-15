--[[ -- для проверки убрать скобки
function main()
-- использование:
---

  local x = 100000
  message(Formatted(x))
end
--]]

function Formatted(text)
-- форматированный вывод xxxx -> x xxx
-- на вход число, на выходе форматированное число с разделителями x xxx xxx xxx
-- для визуального вывода чисел.
---

local txt = tostring(text)
  while true do
    txt, k = string.gsub(txt, "^(-?%d+)(%d%d%d)", '%1 %2')
    if k == 0 then break end
  end
  return txt
end
