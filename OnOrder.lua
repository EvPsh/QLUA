Is_run = true
function main()
    while Is_run do
        sleep(100)
    end
end

function OnStopOrder(id)
    for k, v in pairs(id) do
        message(tostring(k) .. " = " .. tostring(v))
    end
    -- при снятии стоп-заявки получаем
    -- flags = 30
    -- переводим в двоичную систему => 11110
    -- считаем справа налево bit 0 = 0 , bit 1 = 1, bit 2 = 1, bit 3 = 1, bit 4 = 1
    -- смотрим qlua.chm "Флаги для таблицы «Стоп-заявки»"
    -- bit 0 = 0 - Заявка активна, иначе не активна(!)
    -- bit 1 = 1 - Заявка снята(!). Если не установлен и значение бита 0 равно 0, то заявка исполнена 
    -- bit 2 = 1 - Заявка на продажу(!), иначе – на покупку 
    -- bit 3 = 1 - Лимитированная заявка(!)
    -- bit 4 = 1 - в описании нет. есть только bit 5


end

function OnStop()
    Is_run = false
end