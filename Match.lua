--[[ -- для проверки убрать скобки
function main()
-- использование:
---
local example = "RSH3, VBZ2, O4Z2, O2Z2, SiM3, SiH3, SiF3, RIH3, RIM3, LKH3, LKZ2, GDZ2, GMZ2, GZH3, GZZ2, EuZ2, EDZ2, SiZ2, RIZ2"
local ms = {}
ms = Match(example)

for key, value in ipairs(ms) do -- вывод массива
	message("Массив ms: " .. tostring(key) .. " - ".. tostring(value))
end
--]]

function Match(str)
-- отбор из строки данных и возврат массива
---
local m = {}
local x = 1

	for i in string.gmatch(str, "(%w+)") do -- отбор данных из строки до ','
		m[x] = i
		x = x + 1
	end
	return m
end

