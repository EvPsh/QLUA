--[[ -- для теста убрать скобки
function main()
-- для проверки. приостановка на дневной клиринг с 14-00-00 до 14-05-00
---

dofile (StrText.lua) -- требуется наличие ф-ции StrText.lua. вставить правильный путь к файлу или скопировать ф-цию в самый низ этого файла.
    datetime = {}
    datetime = returnTime(getInfoParam("SERVERTIME")) -- массив string datetime.hour, datetime.min, datetime.sec
    -- приостановка на клиринг 14:00 - 14:05

    if StrText(datetime.hour) == "14" and StrText(datetime.min) == "00" and StrText(datetime.sec) == "00" then
        message("Время начала клиринга", 2)
        
        sleep(300000) -- приостановка до 14:05, в миллисекундах (5 минуты = 5 * 60 сек * 1000 мсек)
        datetime = returnTime(getInfoParam("SERVERTIME"))

        message("Клиринг закончился", 2)
    end

end
--]]

function returnTime(time1)
-- ф-ция возврата времени
-- на вход кидаем string "21:00:00"
-- на выходе получаем массив dt1 типа string: 
-- dt1.hour = "21"
-- dt1.min = "00"
-- dt1.sec = "00"
-- использование: 
-- datetime = {}
-- datetime = returnTime(getInfoParam("SERVERTIME"))
---

    local dt1 = {}

    dt1.hour, dt1.min, dt1.sec = string.match(time1,"(%d*):(%d*):(%d*)")
    for key, value in pairs(dt1) do
        dt1[key] = StrText(value)
    end
    return dt1
end
