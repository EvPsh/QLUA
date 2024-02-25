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
end

function PrintTables(str) -- вывод на экран в сообщениях параметры заданных таблиц
    for i = 0, getNumberOf(str) - 1 do
        local tbl = getItem(str, i)
        for k, v in pairs(tbl) do
            msg(tostring(k) .. " = " .. tostring(v)) -- todo
        end
    end
end