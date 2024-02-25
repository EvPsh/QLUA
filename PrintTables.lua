--@JJ_FXE

function msg(text) message(text) end

function main()
    -- Перебор таблиц
    -- вывод в виде сообщений таблиц lua (название полей и значение полей) через getitem
    -- str = "firms"                    --   Фирмы
    -- str = "classes"                  --   Классы
    -- str = "securities"               --   Инструменты
    -- str = "trade_accounts"           --   Торговые счета
    -- str = "client_codes"             --   * Коды клиентов
    -- str = "all_trades"               --   Обезличенные сделки
    -- str = "account_positions"        --   Денежные позиции
    str = "orders"                   --   Заявки
    -- str = "futures_client_holding"   --   Позиции по клиентским счетам (фьючерсы)
    -- str = "futures_client_limits"    --   Лимиты по фьючерсам
    -- str = "money_limits"             --   Лимиты по денежным средствам
    -- str = "depo_limits"              --   Лимиты по бумагам
    -- str = "trades"                   --   Сделки
    -- str = "stop_orders"              --   Стоп-заявки
    -- str = "neg_deals"                --   Заявки на внебиржевые сделки
    -- str = "neg_trades"               --   Сделки для исполнения
    -- str = "neg_deal_reports"         --   Отчеты по сделкам для исполнения
    -- str = "firm_holding"             --   Текущие позиции по бумагам
    -- str = "account_balance"          --   Позиции по клиентским счетам
    -- str = "ccp_holdings"             --   Обязательства и требования по активам
    -- str = "rm_holdings"              --   Валюта: обязательства и требования по активам

    PrintTables(str)
    -- или так:
    PrintTablesMassiv()
end

function PrintTables(str) -- вывод на экран в сообщениях параметры заданных таблиц
    for i = 0, getNumberOf(str) - 1 do
        local tbl = getItem(str, i)
        for k, v in pairs(tbl) do
            msg(tostring(k) .. " = " .. tostring(v)) -- todo
        end
    end
end

function PrintTablesMassiv()
-- то же самое, что и PrintTables(str), только все названия таблиц загнаны в массив и осуществляется перебор массива
---
local str = {
                -- "firms",                    --   Фирмы
                -- "classes",                  --  Классы
                -- "securities",               --   Инструменты
                -- "trade_accounts",           --   Торговые счета
                -- "client_codes",             --   * Коды клиентов
                -- "all_trades",               --   Обезличенные сделки
                -- "account_positions",        --   Денежные позиции
                -- "orders",                   --   Заявки
                -- "futures_client_holding",   --   Позиции по клиентским счетам (фьючерсы)
                -- "futures_client_limits",    --   Лимиты по фьючерсам
                -- "money_limits",             --   Лимиты по денежным средствам
                -- "depo_limits",              --   Лимиты по бумагам
                "trades",                   --   Сделки
                -- "stop_orders",              --   Стоп-заявки
                -- "neg_deals",                --   Заявки на внебиржевые сделки
                -- "neg_trades",               --   Сделки для исполнения
                -- "neg_deal_reports",         --   Отчеты по сделкам для исполнения
                -- "firm_holding",             --   Текущие позиции по бумагам
                -- "account_balance",          --   Позиции по клиентским счетам
                -- "ccp_holdings",             --   Обязательства и требования по активам
                -- "rm_holdings"              --   Валюта: обязательства и требования по активам
            }
    for y = 1, #str do
        for i = 0, getNumberOf(str[y]) - 1 do
            local tbl = getItem(str[y], i)
            for k, v in pairs(tbl) do
                msg(str[y] .. ": " .. tostring(k) .. " = " .. tostring(v)) -- todo
            end
        end
    end
end