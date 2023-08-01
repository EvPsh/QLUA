--[[
function main()
	-- для проверки
	---
	
	message(GetWeekday(3, 1)) 
	-- год 2023, выведет "Wednesday"
end
--]]

function GetWeekday(month, day)

    -- Получаем первый день месяца
    local firstDay = os.date("*t", os.time({year = os.date("%Y"), month = month, day = day}))

    -- Получаем день недели первого дня
    local weekday = os.date("%A", os.time({year = firstDay.year, month = firstDay.month, day = firstDay.day}))

    -- Возвращаем результат
    return weekday
end